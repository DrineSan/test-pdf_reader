
here = File.expand_path(File.dirname(__FILE__))
require File.join(here, '..', 'test_helper')
require 'tmpdir'

class ExtractTextTest < Minitest::Test

  def test_paged_extraction
    Docsplit.extract_text('statuts_dariobat.pdf', :pages => 'all', :output => OUTPUT)
    assert Dir["#{OUTPUT}/*.txt"].length == 2
    assert File.read("#{OUTPUT}/statuts_dariobat.txt").match("capital social")
  end

  # def test_page_only_extraction
  #   Docsplit.extract_text('test/fixtures/obama_arts.pdf', :pages => 2..2, :output => OUTPUT)
  #   assert Dir["#{OUTPUT}/*.txt"] == ["#{OUTPUT}/obama_arts_2.txt"]
  # end

  # def test_capitalized_pdf_extraction
  #   Dir["#{OUTPUT}/*.txt"].each {|previous| FileUtils.rm(previous) }
  #   Dir.mktmpdir do |dir|
  #     FileUtils.cp('test/fixtures/obama_arts.pdf', "#{dir}/OBAMA_ARTS.PDF")
  #     Docsplit.extract_text("#{dir}/OBAMA_ARTS.PDF", :pages => 2..2, :output => OUTPUT)
  #   end
  #   assert Dir["#{OUTPUT}/*.txt"] == ["#{OUTPUT}/OBAMA_ARTS_2.txt"]
  # end

  # def test_unicode_extraction
  #   Docsplit.extract_text('test/fixtures/unicode.pdf', :pages => 'all', :output => OUTPUT)
  #   assert Dir["#{OUTPUT}/*.txt"].length == 3
  # end

  # def test_ocr_extraction
  #   Docsplit.extract_text('test/fixtures/corrosion.pdf', :pages => 'all', :output => OUTPUT)
  #   4.times do |i|
  #     file = "corrosion_#{i + 1}.txt"
  #     assert_directory_contains(OUTPUT, file)
  #     assert File.read(File.join(OUTPUT, file)).size > 1, "Expected that file with extracted text should have reasonable size"
  #   end
  # end

end