class ProductsController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all
  end

  def new
    @categories = Category.all
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    # @categories = Category.find(params[:category_id])
    if @product.save
      # @product.categories << @categories
      redirect_to products_path, notice: "El producto ha sido publicado con éxito"
    else
      render :new
    end
  end

  # def show
  #   @product = Product.find(params[:id])
  # end

  def edit
    @categories = Category.all
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      redirect_to products_path, notice: "El producto ha sido modificado con éxito"
    else
      render :edit
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy

    redirect_to products_path, notice: "El producto fue eliminado con éxito"
  end

  private
    def product_params
      params.require(:product).permit(:name, :price)
    end
end
