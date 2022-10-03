class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:new, :create]
  before_action :ensure_cart_isnt_empty, only: :new
  before_action :set_order, only: [:show]


  def index
    @orders=Order.all
  end
  def show
  end
  def new
    @order = Order.new
  end
  def create
    @order = Order.new(order_params)
    @order.name=current_user.name
    @order.user_id=current_user.id
    @order.add_line_items_from_cart(@cart)
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        flash[:notice]="Thank you for order"
        redirect_to products_path
      else
        render 'new'
      end
    end
  end


  private
  def set_order
    @order = Order.find(params[:id])
  end
    def order_params
      params.require(:order).permit(:name,:address,:mobilenumber,:Line1,:Line2,:city,:state,:postalcode,:country,:pay_id)
    end

    def ensure_cart_isnt_empty
      if @cart.cartitems.empty?
      redirect_to products_path, notice: 'Your cart is empty'
      end
    end
