class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.includes(:status, :category, image_attachment: :blob)
                      .find(params[:id])
    @category_names = @product.category.ancestors.pluck(:name)
  end

  def new
  end
end
