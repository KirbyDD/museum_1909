class Museum
  attr_reader :name, :exhibits, :patrons
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
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

  def admit patron
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    hash = @exhibits.reduce({}) do |acc,exhibit|
      acc[exhibit] = []
      acc
    end

    @exhibits.each do |exhibit|
      @patrons.each do |patron|
        if patron.interests.include? exhibit.name 
          hash[exhibit] << patron
        end
      end
    end
    hash
  end
end