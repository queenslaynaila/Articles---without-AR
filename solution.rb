# Please copy/paste all three classes into this file to submit your solution!
class Article
  attr_reader :author,:magazine,:title
  @@all = []
  def initialize (author,magazine,title)
    @author = author
    @magazine = magazine
    @title = title
    @@all << self
  end
  def self.all
    @@all
  end
end

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

class Magazine
  attr_accessor :name, :category
  @@all = []

  def initialize(name, category)
    @name = name
    @category = category
    @@all << self
  end
  def self.all
    @@all
  end
  def contributors
    Article.all.select do |article|
      article.magazine == self
    end.map do |article|
      article.author
    end
  end
  def self.find_by_name (name)
    Magazine.all.find do |magazine|
      magazine.name == name
    end
  end
  def article_titles
    Article.all.select do |article|
      article.magazine == self
    end.map do |article|
      article.title
    end
  end
  def contributing_authors
    self.contributors.select do|author|
      author.articles.count > 2
    end
  end
end
