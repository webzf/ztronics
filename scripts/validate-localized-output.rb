#!/usr/bin/env ruby
# Verify that Dutch and Polish pages are emitted at their public language-prefixed routes.
# Jekyll Polyglot adds the language prefix; localized permalinks must not.

require "fileutils"

site_root = ARGV.fetch(0) { abort "Usage: ruby scripts/validate-localized-output.rb SITE_ROOT" }
site_root = File.expand_path(site_root)

required = %w[
  de/products/guition-jc8048w550/index.html
  es/products/guition-jc8048w550/index.html
  fr/products/guition-jc8048w550/index.html
  it/products/guition-jc8048w550/index.html
  nl/products/guition-jc8048w550/index.html
  pl/products/guition-jc8048w550/index.html
  pt/products/guition-jc8048w550/index.html
  nl/products/guition-esp32-s3-4848s040/index.html
  nl/products/seeed-xiao-esp32s3-sense/index.html
  nl/products/sunton-esp32-8048s043c/index.html
  nl/sunton-esp32-8048s043c-guide/index.html
  nl/guition-esp32-s3-4848s040-pinout-esphome/index.html
  pl/products/guition-esp32-s3-4848s040/index.html
  pl/products/seeed-xiao-esp32s3-sense/index.html
  pl/products/sunton-esp32-8048s043c/index.html
  pl/sunton-esp32-8048s043c-guide/index.html
  pl/guition-esp32-s3-4848s040-pinout-esphome/index.html
]

errors = []
required.each do |relative_path|
  full_path = File.join(site_root, relative_path)
  if File.file?(full_path)
    puts "Localized route PASS: /#{relative_path.sub(%r{/index\.html$}, "/")}"
  else
    errors << "Missing generated localized page: #{full_path}"
  end
end

%w[de es fr it nl pl pt].each do |language|
  duplicate_root = File.join(site_root, language, language)
  errors << "Duplicate language prefix detected: #{duplicate_root}" if File.directory?(duplicate_root)
end

if errors.any?
  warn "Localized output validation: FAIL"
  errors.each { |error| warn " - #{error}" }
  exit 1
end

puts "Localized output validation: PASS (#{required.length} routes)"
