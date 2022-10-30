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
