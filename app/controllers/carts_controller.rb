class CartsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_selected_dish,only:[:show,:edit,:update,:destroy]

  def index
    @selected_dishes=SelectedDish.all
  end
  def show
  end
  def new
    @selected_dish=SelectedDish.new
  end

  def create
     dish = Dish.find(params[:dish_id])
     @selected_dish = @cart.add_dish(dish)
    if @selected_dish.save
      flash[:notice]="selected_dish created successfully"
      @current_item = @selected_dish
      redirect_to @selected_dish
    else
      render 'new'
    end
  end
  def edit
  end
  def update
    if @selected_dish.update(selected_dish_params)
      flash[:notice]="selected_dish updated successfully"
      redirect_to @selected_dish
    else
      render 'edit'
    end
  end
  def destroy
    @selected_dish.destroy
    flash[:notice]="selected_dish deleted"
    redirect_to selected_dishes_path
  end
  private
  def set_selected_dish
    @selected_dish=SelectedDish.find(params[:id])
  end
  def selected_dish_params
    params.require(:selected_dish).permit(:dish_id, :cart_id)
  end

end
