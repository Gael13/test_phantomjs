class OrdersController < ApplicationController
  def index
  	# sleep 1
  	@orders = Order.page(params[:page]).per_page(10)
  end
  
  def new
    @order = Order.new(amount: 19.99)
  end

  def create
    @order = Order.new(order_params)
    @order.purchase
    redirect_to orders_url, notice: "Order created."
  end

  private

  def order_params
    params.require(:order).permit(:amount, :card_last_four, :number, :card_number, :card_expires_on)
  end	
end

  