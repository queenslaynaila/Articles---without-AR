 
require_relative "./article.rb"
require_relative "./magazine.rb"
class Author
  attr_reader :name
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end
  def articles
    Article.all.select do |article|
      article.author == self
    end
  end
  def magazines
   self.articles.map do |article|
      article.magazine
    end.uniq
  end
  def add_article(magazine,title)
     Article.new(self,magazine,title)
  end
  def topic_areas
    self.articles.map do |article|
      article.magazine.category
    end
  end
end
