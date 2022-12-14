# Please copy/paste all three classes into this file to submit your solution!
#Article class
require_relative "./author.rb"
require_relative "./magazine.rb"
class Article
   
    attr_reader :author, :magazine, :title
    
    @@all = []
 
    def initialize(author, magazine, title)
        @author = author
        @magazine = magazine
        @title = title
        @@all << self
    end
    
    def self.all
        @@all
    end

end
#Author class
require_relative "./article.rb"
class Author
  attr_accessor :name
  def initialize(name)
    @name = name
  end
  def magazine
    self.article.map do |art|
      art.magazine
    end.uniq
  end
  #the above magazine method should return array of magazine as unique instances for the contribution from the author.
 #This article method returns instances of article that the author writes.
  def article
    Article.all.select do |art|
      article.author.name == self.name
    end
  end
  # Add_article method creates a new instace of article whenever the magazine and the title are provided thus relating it to the author against the magazine instance.
  def add_article(title, magazine_name, magazine_category)
    Article.new(title, self, magazine_name,magazine_category)
  end
  # this topic_areas returns a unique value of strings in arrays with the magazines as the categories in relation to the contribution from the author
  def topic_areas
    self.magazine.map do |gazet|
      gazet.category
    end
  end

end
#Magazine Class
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