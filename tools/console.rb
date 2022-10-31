require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


###  WRITE YOUR TEST CODE HERE ###


author1 = Author.new("queenslayjema")
forbes = Magazine.new("Forbes","life")
puts author1.articles
article1 = Article.new(author1, forbes,"GETTING THAT PAPER")





### DO NOT REMOVE THIS
binding.pry

0
