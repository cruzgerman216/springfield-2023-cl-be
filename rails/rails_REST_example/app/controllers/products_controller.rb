class ProductsController < ApplicationController
  # List all products
  def index
    @products = Product.all
  end

  # See specific product
  def show
    @product = Product.find(params[:id])
  end

  #  GET - create form
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(name: params[:product][:name], description: params[:product][:description])

    if @product.save 
      flash[:notice] = "Product saved successfully"
      redirect_to products_path 
    else 
      flash[:notice] = "Product saved unsuccessfully"
      # redirect_to "products/new"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
