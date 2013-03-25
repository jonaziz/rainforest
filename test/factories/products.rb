# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	#if class matches name, it knows what class to use
	factory :product do 
		name "Shoes"
		description "Nice patent white leather shoes"
		price_in_cents 9900
	end

	# if not, you need to define the class
	factory :cheap_product, :class => Product do
		name "Book"
		description "Has pictures"
		price_in_cents 9900
	end
end