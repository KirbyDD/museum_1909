require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/exhibit.rb'
require_relative '../lib/patron.rb'

class PatronTest < Minitest::Test 
  def setup
    @bob = Patron.new("Bob", 20)
  end

  def test_it_exist
    assert_instance_of Patron, @bob
  end

  def test_it_has_a_name
    assert_equal "Bob", @bob.name
  end

  def test_it_has_spending_money
    assert_equal 20, @bob.spending_money
  end

  def test_has_no_interest_my_default
    assert_equal [], @bob.interests
  end

  def test_add_interest_method
    bob.add_interest("Dead Sea Scrolls")
    assert_equal ["Dead Sea Scrolls"], @bob.interests
    bob.add_interest("Gems and Minerals")
    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], @bob.interests
  end
end