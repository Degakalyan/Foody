class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show,:edit,:update,:destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_admin_user, only: [:create,:edit, :update, :destroy]

  def index
   @restaurants=Restaurant.paginate(page: params[:page], per_page: 3)
  end

  def search
    @restaurants = Restaurant.where("name LIKE ?","%"+params[:q]+"%")
  end

  def new
    @restaurant=Restaurant.new
  end

  def create
    @restaurant=Restaurant.new(restaurant_params)

  end

  def edit
  end

  def update
     @restaurant.update(restaurant_params)
      flash[:notice]="Restaurant updated successfully"
      redirect_to @restaurant
      end


  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end


  private

  def set_restaurant
    @restaurant=Restaurant.find(params[:id])

  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :location, :timings)
  end

  def require_admin_user
    if current_user.role!='admin'
      flash[:alert] = "Admin can only modify restaurants"
      redirect_to @restaurant
    end
  end

end
