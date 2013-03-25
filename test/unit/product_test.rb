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

  test "price_in_cents must be a number" do
  	@p.price_in_cents = "asdf"
  	refute @p.valid?
  end

  test "price_in_cents must be an integer" do
  	@p.price_in_cents = 1.02
  	refute @p.valid?
  end
end
