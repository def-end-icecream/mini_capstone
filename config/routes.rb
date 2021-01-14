Rails.application.routes.draw do
  namespace :api do
    get "/all_products_path" => "products#all_products_action"
    get "/first_product_path" => "products#first_product_action"
  end
end
