class ReviewsController < ApplicationController
  before_filter :load_product

  # GET /reviews
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  def show
    @review = Review.find(params[:id])
  end

  # POST /reviews
  def create
    # @review = Review.new(
    #   :comment => params[:review][:comment],
    #   :product_id => @product.id,
    #   :user_id => current_user.id
    # )

    #automatically sets product ID (by working via product)
    @review = @product.reviews.build(
      :comment => params[:review][:comment],
      :user_id => current_user.id
      )

    if @review.save
      redirect_to @product, notice: 'Review was successfully created.'
    else
      render "products/show"
    end
  end

  # DELETE /reviews/1
  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to product_reviews_path
  end

  # This method will load before every method in the controller
  def load_product
    @product = Product.find(params[:product_id])
  end
end