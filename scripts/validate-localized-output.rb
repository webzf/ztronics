#!/usr/bin/env ruby
# Verify that Dutch pages are emitted at the public /nl/ routes.
# Jekyll Polyglot adds the language prefix; localized permalinks must not.

require "fileutils"

site_root = ARGV.fetch(0) { abort "Usage: ruby scripts/validate-localized-output.rb SITE_ROOT" }
site_root = File.expand_path(site_root)

required = %w[
  nl/products/guition-esp32-s3-4848s040/index.html
  nl/products/seeed-xiao-esp32s3-sense/index.html
  nl/products/sunton-esp32-8048s043c/index.html
  nl/sunton-esp32-8048s043c-guide/index.html
  nl/guition-esp32-s3-4848s040-pinout-esphome/index.html
]

errors = []
required.each do |relative_path|
  full_path = File.join(site_root, relative_path)
  if File.file?(full_path)
    puts "Dutch route PASS: /#{relative_path.sub(%r{^nl/}, "nl/").sub(%r{/index\\.html$}, "/")}"
  else
    errors << "Missing generated Dutch page: #{full_path}"
  end
end

duplicate_root = File.join(site_root, "nl", "nl")
errors << "Duplicate language prefix detected: #{duplicate_root}" if File.directory?(duplicate_root)

if errors.any?
  warn "Dutch output validation: FAIL"
  errors.each { |error| warn " - #{error}" }
  exit 1
end

puts "Dutch output validation: PASS (#{required.length} routes)"
