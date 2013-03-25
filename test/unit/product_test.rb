require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
  	@p = FactoryGirl.create(:product)
  	assert @p.valid?
  end

  test "must have a name" do
  	@p.name = ""
  	refute @p.valid?
  end

  test "must have a description" do
  	@p.description = ""
  	refute @p.valid?
  end

  test "must have a price_in_cents" do
  	@p.price_in_cents = ""
  	refute @p.valid?

  	@p.price_in_cents = nil
  	refute @p.valid?
  end

  # test "must have a price_in_dollars" do
  # 	assert_equal @p.price_in_dollars, 99.0
  # end

  test "must refute invalid price_in_dollars" do
  	@p.price_in_cents = nil
  	@p.price_in_dollars = "abc"

  	assert_equal nil, @p.price_in_dollars
  	refute @p.valid?
  end

  test "must handle many decimal places price_in_dollars" do
  	@p.price_in_cents = nil
  	@p.price_in_dollars = "12.90123"

  	assert_equal 12.90, @p.price_in_dollars
  	assert_equal 1290, @p.price_in_cents
  	assert @p.valid?
  end

  test "updates cents value from price_in_dollars correctly" do
  	@p.price_in_cents = nil
  	@p.price_in_dollars = "abc"

  	assert_equal nil, @p.price_in_dollars
  	refute @p.valid?
  end

  test "converts price_in_dollars to cents correctly" do
  	@p.price_in_cents = 999
  	assert_equal 9.99, @p.price_in_dollars
  end

  test "dollar conversion is not performed for empty/blank cents value" do
  	@p.price_in_cents = nil
  	assert_nil @p.price_in_dollars
  end

  test "price_in_cents must be a number" do
  	@p.price_in_cents = "asdf"
  	refute @p.valid?
  end

  test "price_in_cents must be an integer" do
  	@p.price_in_cents = 1.02
  	refute @p.valid?
  end
end
