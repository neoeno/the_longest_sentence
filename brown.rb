require 'rubygems'
require 'bundler/setup'
Bundler.require

require_relative 'lib/word_collection'
require_relative 'lib/brown_parser'

def populate_brown_collection!
  word_collection = WordCollection.new
  brown_parser = BrownParser.new

  BrownParser.news_corporea.each do |corpus_file|
    brown_parser.parse corpus_file
  end

  brown_parser.words.each do |word|
    word_collection.store word.tag, word.word
  end

  word_collection
end

def f_result(arr)
  arr.join(' ').gsub(/\s([.,])/, '\1') + " "
end


word_collection = populate_brown_collection!

## Building stuff

print f_result(word_collection.build(['np', 'bedz', '@the', 'jjt', 'nn'])).capitalize

7_142.times do
  print f_result word_collection.build(['@of', '@the', 'jjt', 'nn', '@,', '@the', 'jjt', 'nn'])
end

print f_result word_collection.build(['@and', '@the', 'jjt', 'nn', '@.'])

print "\n"
