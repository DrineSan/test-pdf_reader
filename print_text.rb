require 'rubygems'
require 'bundler/setup'

require 'pdf-reader'

reader = PDF::Reader.new(ARGV[0])

# puts reader.page_count

pages = reader.pages.map do |page|
  page.text
end

content = pages.join("\n")

puts content
