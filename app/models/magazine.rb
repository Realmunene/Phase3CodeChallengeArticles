require_relative './article.rb'

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

  def articles
    Article.all.filter {|article| article.magazine == self}
  end
# This method should return the title of the magazines
  def article_titles
    self.articles.map {|article| article.title}
  end
# This method returns an array of authors with more than 2 magazine
  def contributors
    self.articles.map {|article| article.author}.uniq
  end
  def self.find_by_name(name)
    self.all.find {|magazine| magazine.name == name}
  end
end

