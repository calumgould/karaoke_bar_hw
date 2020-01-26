require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../drink')

class TestDrink < Minitest::Test

  def setup
    @drink1 = Drink.new("Gin & Tonic", 10)
    @drink2 = Drink.new("Beer", 5)
    @drink3 = Drink.new("Wine", 20)
    @drink4 = Drink.new("Champagne", 50)

    @drinks_available = [@drink1, @drink2, @drink3, @drink4]
  end

  def test_drink_name
    assert_equal("Champagne", @drink4.name)
  end

  def test_drink_price
    assert_equal(20, @drink3.price)
  end

  def test_drinks_available
    assert_equal(4, @drinks_available.count())
  end
end
