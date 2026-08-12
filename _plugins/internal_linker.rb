puts "============================================================"
puts "EMBEDDED NERD INTERNAL LINKER: PLUGIN LOADED"
puts "============================================================"

Jekyll::Hooks.register :posts, :post_render do |post|
  puts "INTERNAL LINKER: POST -> #{post.url}"
end

Jekyll::Hooks.register :pages, :post_render do |page|
  puts "INTERNAL LINKER: PAGE -> #{page.url}"
end
