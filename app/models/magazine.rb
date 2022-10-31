require_relative "./article.rb"
require_relative "./author.rb"
require "pry"
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

