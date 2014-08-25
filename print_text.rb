require 'rubygems'
require 'bundler/setup'

require 'pdf-reader'

require 'docsplit'


# reader = PDF::Reader.new(ARGV[0])

# #####   test avec pdfreader
# reader = PDF::Reader.new('statuts_dariobat.pdf')

# # puts reader.page_count

# pages = reader.pages.map do |page|
#   page.text
# end

# content = pages.join("\n")

# puts content

# puts reader.pdf_version

# puts reader.metadata

# #####   test avec docsplit
filename = 'statuts_dariobat'
docs = Dir[filename+'.pdf']
puts Docsplit.extract_text(docs, :ocr => true, :output => 'storage/text')
text = File.read('storage/text/'+ filename + '.txt')
puts text
