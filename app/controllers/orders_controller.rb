class OrdersController < ApplicationController
  before_action :set_item
  before_action :move_to_root

  def index
    @order = OrderItem.new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def new
    @order = OrderItem.new
  end

  def create
    @order = OrderItem.new(order_params)
    binding.pry
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  
  private

  def order_params
    params.require(:order_item).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :token).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    @order = Order.pluck(:item_id)
    if @order.include?(@item.id) || @item.user_id == current_user.id
      redirect_to root_path
    end
  end

end
