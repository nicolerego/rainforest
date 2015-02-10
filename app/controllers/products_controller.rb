class ProductsController < ApplicationController
  before_filter :ensure_logged_in, only: [:create, :destroy, :edit, :update]

  def index
  	@products = Product.all
  end

  def show
  	@product = Product.find(params[:id])

    if current_user
      @review = @product.reviews.build
    end 
    @newest_first_review = Review.newest_first
  end

  def new
  	@product = Product.new
    # @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  def edit
  	@product = Product.find(params[:id])
    # @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  def create
  	@product = Product.new(product_params)
    @product.owner = current_user

    # @product.category_id = params[:category_id]
    # respond_to do |format|
    #   if @product.save
    #     format.html { redirect_to @product, notice: 'Product was successfully created.' }
    #     format.json { render :show, status: :created, location: @product }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @product.errors, status: :unprocessable_entity }
    #   end
    # end

  	if @product.save
  		redirect_to product_path(@product)
  	else
  		render :new
  	end 
  end 

  def update
  	@product = Product.find(params[:id])
    # @product.category_id = params[:category_id]

  	if @product.update_attributes(product_params)
  		redirect_to product_path(@product)
  	else
  		render :edit
  	end 
  end 

  def destroy
  	@product = Product.find(params[:id])
  	@product.destroy
  	redirect_to products_path
  end

  private
  def product_params
  	params.require(:product).permit(:name, :description, :price_in_cents)
  end 

end
