class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user
end



# create an order controller
# make a route that leads to the orders create action
# make the create action in the orders controller
# render an api view and test it
# add code to the create action to make a new order - should collect params for quantity and product_id from the body, should collect user_id from the current_user helper method
# find a product, and use product model methods or do logic in the controller action to calculate subtotal, tax, and total
# happy and sad path for if order is saved successfully or not
# test action in Insomnia with passing of JWT (aka user being logged in) and necessary params (quantity and product_id)