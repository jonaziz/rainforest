class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price_in_cents, :price_in_dollars

  validates :description, :name, :presence => true
  validates :price_in_cents, :numericality => {:only_integer => true}

  	def price_in_dollars
	  	# integer => 2 decimal float
		self.price_in_cents.to_f/100.00
		# Ruby function. Give formatting, then give data.
		## Not necesary when using a helper
		# sprintf("%.2f", price_in_dollars)
	end

	def price_in_dollars=(amount)
		# amount => 6.42
		# this requires self. in order to refer to the instance variable
		## must account for data coming in (as a string)
		## all data comes in as string (from browser)
		self.price_in_cents = (amount.to_f * 100).to_i
	end
end
