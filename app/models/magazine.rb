require_relative "./article"
class Magazine
  attr_accessor :name, :category
@@all = []
  def initialize(name, category)
    @name = name
    @category = category
    @@all<<self
def self.all
  @all
end
def contribution
  Article.all.select do |article|
    article.magazine.name == self.name && article.magazine.category == self.category
  end.map do |art|
    art.author
  end
end
def self.find_by_name(name)
  self.all.find do |gazet|
    gazet.name == name
  end
  end
  def article_titles
    Article.all.select do |article|
      article.magazine.name == self.name && article.magazine.category == self.category
    end.map do |article|
      article.title
    end
  end
# This method should return the title of the magazines
  def contributing_authors
    self.contributors.filter {|author|author.articles.count > 2}
  end 
# This method returns an array of authors with more than 2 magazine
end
