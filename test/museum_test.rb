require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/exhibit.rb'
require_relative '../lib/patron.rb'
require_relative '../lib/museum.rb'

class MuseumTest < Minitest::Test 
  def setup
    @dmns = Museum.new("Denver Museum of Nature and Science")
  end

  def test_it_exist
    assert_instance_of Museum, @dmns
  end

  def test_it_has_a_name
    assert_equal "Denver Museum of Nature and Science", @dmns.name
  end

  def test_has_no_exhibit_by_default
    assert_equal [], @dmns.exhibits
  end

  def test_add_exhibit_method
    gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    imax = Exhibit.new("IMAX", 15)

    @dmns.add_exhibit(gems_and_minerals)
    assert_equal [gems_and_minerals], @dmns.exhibits

    @dmns.add_exhibit(dead_sea_scrolls)
    assert_equal [gems_and_minerals, dead_sea_scrolls], @dmns.exhibits
  end

  def test_recommend_exhibit_method
    gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    imax = Exhibit.new("IMAX", 15)

    bob = Patron.new("Bob", 20)
    sally = Patron.new("Sally", 20)

    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Gems and Minerals")
    sally.add_interest("IMAX")

    @dmns.add_exhibit(gems_and_minerals)
    @dmns.add_exhibit(dead_sea_scrolls)
    @dmns.add_exhibit(imax)

    assert_equal [gems_and_minerals, dead_sea_scrolls], @dmns.recommend_exhibits(bob)
    
    assert_equal [imax], @dmns.recommend_exhibits(sally)
  end

end