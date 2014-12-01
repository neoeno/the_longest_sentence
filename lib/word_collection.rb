class WordCollection
  attr_accessor :collection

  def initialize
    @collection = {}
  end

  def store(tag, word)
    tag.downcase!
    word.downcase!
    @collection[tag] ||= []
    @collection[tag] << word unless @collection[tag].include? word
  end

  # not sure this should be here
  def store_tree(tree)
    tree.each do |branch|
      binding.pry
      store branch.tag, branch.to_s
      store_tree(branch) unless branch.children.empty?
    end
  end

  def pick(tag)
    tag.downcase!
    @collection[tag].sample
  rescue
    nil
  end

  def build(tags)
    tags.map do |tag|
      tag.downcase!
      if tag.start_with? '@'
        tag[1..-1]
      else
        pick tag
      end
    end
  end
end
