class Museum
  attr_reader :name, :exhibits
  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit exhibit
    @exhibits << exhibit
  end

  def recommend_exhibits patron
    result = []
    @exhibits.each do |exhibit|
      if patron.interests.include? exhibit.name 
        result << exhibit
      end
    end
    result
  end
end