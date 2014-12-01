require 'rubygems'
require 'bundler/setup'
Bundler.require

include Treat::Core::DSL

class WordCollection

  attr_accessor :collection

  def initialize
    @collection = {}
  end

  def store(tag, word)
    @collection[tag] ||= []
    @collection[tag] << word
  end

  def store_tree(tree)
    tree.each do |branch|
      binding.pry
      store branch.tag, branch.to_s
      store_tree(branch) unless branch.children.empty?
    end
  end

  def pick(tag)
    @collection[tag].sample
  rescue
    nil
  end

  def build(tags)
    tags.map do |tag|
      if tag.starts_with? '@'
        tag
      else
        pick tag
      end
    end
  end
end

def reproduce(wc, str)
  words = sentence(str).apply(:tokenize, :parse)
  words.map do |word|
    new_word = wc.pick word.tag
    puts "Replacing #{word.to_s} (#{word.tag}) with #{new_word}"
    new_word
  end.join(' ')
end

wc = WordCollection.new

doc = document './text.txt'

# doc.chunk.each do |paragraph|
#   tagged_paragraph = paragraph.apply(:chunk, :segment, :tokenize, :parse)
#   wc.store_tree tagged_paragraph
# end
#
# puts reproduce(wc, "The evolution of the horse family is a good example of the way that evolution works")

para = paragraph("The evolution of the horse family is a good example of the way that evolution works").apply(:chunk, :segment, :tokenize, :parse)
wc.store_tree para

# structure = ['S', ','].concat(['CC', 'S', 'CC', 'S']*10)
# puts wc.build(structure).join(' ').gsub('.', '')

# paragraph("an illustration of the wider process of natural selection was vitally important").apply(:chunk, :segment, :tokenize, :parse).print_tree
puts wc.build(%w{DT NN VBD ADVP ADJP}).join(' ')
puts wc.build(%w{DT NN VBD ADVP ADJP}).join(' ')
puts wc.build(%w{DT NN VBD ADVP ADJP}).join(' ')
puts wc.build(%w{DT NN VBD ADVP ADJP}).join(' ')
puts wc.build(%w{DT NN VBD ADVP ADJP}).join(' ')
puts wc.build(%w{DT NN VBD ADVP ADJP}).join(' ')
