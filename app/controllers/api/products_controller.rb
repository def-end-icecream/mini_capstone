class Api::ProductsController < ApplicationController

  def all_products_action
    @products = Product.all # returns array of product hashes
    render "all_products.json.jb"
  end

  def first_product_action
    @product = Product.first # returns first hash of product data
    render "first_product.json.jb"
  end

end
