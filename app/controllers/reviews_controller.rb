class ReviewsController < ApplicationController
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
    @review = Review.new(params[:review])

    if @review.save
      redirect_to @review, notice: 'Review was successfully created.'
    else
      render action: "new"
    end
  end

  # DELETE /reviews/1
  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to reviews_url
    end
  end
end