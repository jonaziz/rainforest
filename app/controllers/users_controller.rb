class UsersController < ApplicationController
	def new
    @user = User.new 
  end

  def create
   @user = User.new(params[:user])

    if @user.save
      flash[:notice] = 'Account created! Welcome to Rainforest.'
      redirect_to products_path
    else
      # redirect is equal to user going to browser and entering a URL. New page, drops what you were doing.
      # render doesn't run the new action again, but renders the view (with errors)
      render action: "new"
      # Still the create action; rendering "new" view.
    end
  end
end


# Note on Flash
  # flash[:notice] => everything is okay
  # flash[:alert] => something happened the user should know about, but not an error
  # flash[:error] => something went wrong