class Api::OrdersController < ApplicationController

  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render "index.json.jb"
  end

  def create
    @order = Order.new(
      quantity: params[:quantity],
      product_id: params[:product_id],
      user_id: current_user.id
    )
    @order.subtotal = @order.quantity * @order.product.price
    @order.tax = @order.subtotal * 0.09
    @order.total = @order.subtotal + @order.tax
    if @order.save
      render "show.json.jb"
    else
      render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
    if @order
      render "show.json.jb"
    else
      render json: {}, status: :unauthorized
    end
  end
end
