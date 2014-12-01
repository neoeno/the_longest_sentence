class BrownParser
  attr_reader :words

  def self.news_corporea
    %w{corporea/ca01 corporea/ca02 corporea/ca03 corporea/ca04 corporea/ca05 corporea/ca06 corporea/ca07 corporea/ca08 corporea/ca09 corporea/ca10 corporea/ca11 corporea/ca12 corporea/ca13 corporea/ca14 corporea/ca15 corporea/ca16 corporea/ca17 corporea/ca18 corporea/ca19 corporea/ca20 corporea/ca21 corporea/ca22 corporea/ca23 corporea/ca24 corporea/ca25 corporea/ca26 corporea/ca27 corporea/ca28 corporea/ca29 corporea/ca30 corporea/ca31 corporea/ca32 corporea/ca33 corporea/ca34 corporea/ca35 corporea/ca36 corporea/ca37 corporea/ca38 corporea/ca39 corporea/ca40 corporea/ca41 corporea/ca42 corporea/ca43 corporea/ca44}
  end

  def initialize
    Struct.new("Word", :word, :tag)
    @words = []
  end

  def parse(filename)
    File.readlines(filename).each do |line|
      @words.concat parse_line(line)
    end
  end

  private

  def parse_line(line)
    line.split(' ').map do |pair|
      # We want to split into two halves by last '/'
      partitioned = pair.rpartition('/')
      make_word_from_pair [partitioned.first, partitioned.last]
    end
  end

  def make_word_from_pair(pair)
    Struct::Word.new(*pair)
  end
end
