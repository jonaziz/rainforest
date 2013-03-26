class SessionsController < ApplicationController
	# Login form
	def new

	end

	# Starting session
	## Not a new thing in DB (actually cookie), but associates user with a session
	def create
		user = User.find_by_email(params[:email])
		# Equivalent: User.where(:email => params[:email]).first
		## In theory, where could return multiple entries, but we have validation 

		# Was user found? AND
		if user && user.authenticate(params[:password])
			# We're storying user.id with key :user_id, but you can store many
			# different things. This gets encrypted and stored in the browser as
			# a cookie. User.id is conventional (due to size limit of cookies).
			session[:user_id] = user.id
			redirect_to products_path, :notice => "Logged in!"
		else
			flash.now[:alert] = "Invalid email or password"
			render "new"
		end
	end

	# Ending session
	def destroy
		session[:user_id] = nil
		redirect_to products_path, :notice => "Logged out!"
	end

end
