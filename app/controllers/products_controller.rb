class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
    @reviews = Review.where(product_id: @product.id)(created_at: desc)
  end

  def show
    @product = Product.find params[:id]
  end

end
