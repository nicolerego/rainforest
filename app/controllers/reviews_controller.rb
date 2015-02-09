class ReviewsController < ApplicationController
  before_filter :ensure_logged_in, only: [:create, :destroy, :edit, :update]
  before_filter :load_product

  def index
  end 

  def show
  	@review = Review.find(params[:id])
    # @newest_first_review = Review.newest_first
  end

  def edit
    @review = Review.find(params[:id])
  end

  def create
  	@review = @product.reviews.build(review_params)
  	@review.user = current_user
  	if @review.save
  		redirect_to product_path(@product), notice: 'Review created successfully.'
  	else
  		render 'products/show'
  	end
  end

  def update
    @review = Review.find(params[:id])

    if @review.update_attributes(review_params)
      redirect_to product_path(@product)
    else
      render :edit
    end 
  end 

  def destroy
  	@review = Review.find(params[:id])
  	@review.destroy
    redirect_to product_path(@product)
  end

  private
  def review_params
  	params.require(:review).permit(:comment, :product_id)
  end 

  def load_product
  	@product = Product.find(params[:product_id])
  end 
end
