#!/usr/bin/env ruby
# Validate the Embedded Nerd commerce database without contacting merchants.

require "yaml"
require "date"

ROOT = File.expand_path("..", __dir__)
commerce_path = File.join(ROOT, "_data", "commerce.yml")

abort "Missing #{commerce_path}" unless File.file?(commerce_path)

commerce = YAML.load_file(commerce_path) || {}
errors = []

product_ids = Dir[File.join(ROOT, "_products", "*.md")].filter_map do |path|
  text = File.read(path, encoding: "UTF-8")
  next unless text.start_with?("---")
  fm = text.split("---", 3)[1]
  data = YAML.safe_load(fm, permitted_classes: [Date, Time]) || {}
  data["product_id"] || File.basename(path, ".md")
end.to_h { |id| [id, true] }

commerce.each do |product_id, entry|
  unless entry.is_a?(Hash)
    errors << "#{product_id}: entry must be a mapping"
    next
  end

  unless product_ids[product_id]
    errors << "#{product_id}: no matching _products entry"
  end

  stores = entry["stores"]
  unless stores.is_a?(Hash) && !stores.empty?
    errors << "#{product_id}: stores must be a non-empty mapping"
    next
  end

  preferred = entry["preferred_store"].to_s
  unless stores.key?(preferred)
    errors << "#{product_id}: preferred_store '#{preferred}' is not defined"
  end

  preferred_offer = stores[preferred]
  unless preferred_offer.is_a?(Hash) && preferred_offer["enabled"] == true
    errors << "#{product_id}: preferred store '#{preferred}' must be enabled"
  end

  stores.each do |merchant, offer|
    unless offer.is_a?(Hash)
      errors << "#{product_id}/#{merchant}: offer must be a mapping"
      next
    end

    url = offer["affiliate_url"].to_s

    if offer["enabled"] == true
      errors << "#{product_id}/#{merchant}: enabled offer needs affiliate_url" if url.empty?
      errors << "#{product_id}/#{merchant}: affiliate_url must be http(s)" unless url.match?(/\Ahttps?:\/\//)
    end

    if offer.key?("product_id")
      errors << "#{product_id}/#{merchant}: product_id requires product_url" if offer["product_url"].to_s.empty?
      errors << "#{product_id}/#{merchant}: product_url must be http(s)" unless offer["product_url"].to_s.match?(/\Ahttps?:\/\//)
      begin
        Date.iso8601(offer["last_verified"].to_s)
      rescue ArgumentError
        errors << "#{product_id}/#{merchant}: last_verified must be YYYY-MM-DD"
      end
    end
  end
end

routes_dir = File.join(ROOT, "go", "hardware")
commerce.each_key do |product_id|
  route = File.join(routes_dir, product_id, "index.html")
  errors << "#{product_id}: missing /go/hardware route" unless File.file?(route)
end

if errors.any?
  warn "Commerce validation failed:"
  errors.each { |error| warn " - #{error}" }
  exit 1
end

puts "Commerce validation: PASS (#{commerce.length} products)"
