module ProductsHelper

	# Can define a helper here to make view cleaner
	# Note: helpers are only available in the view
	## Their function is formatting (display)
	def product_price(product)
		number_to_currency product.price_in_dollars
	end
end
