class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price_in_cents

  validates :description, :name, :presence => true
  validates :price_in_cents, :numericality => {:only_integer => true}

  	def price_in_dollars
	  	# integer => 2 decimal float
		price_in_dollars = price_in_cents.to_f/100.00
		# Ruby function. Give formatting, then give data.
		## Not necesary when using a helper
		# sprintf("%.2f", price_in_dollars)
	end
end
