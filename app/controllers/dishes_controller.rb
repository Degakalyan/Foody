class DishesController < ApplicationController
  before_action :set_dish, only: [:show,:edit,:update,:destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_admin_user, only: [:create,:edit, :update, :destroy]
  def index
   @dishes=Dish.paginate(page: params[:page], per_page: 5)
  #@dishes = Dish.search(params[:search])

  end
  def search
    @dishes = Dish.where("name LIKE ?","%"+params[:q]+"%")
  end

  def new
    @dish=Dish.new
  end

  def create
    @dish=Dish.new(dish_params)
    if @dish.save
      flash[:notice]="Dish created sucessfully"
      redirect_to @dish
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @dish.update(dish_params)
      flash[:notice]="Dish updated successfully"
      redirect_to @dish
    else
      render 'edit'
    end
  end

  def destroy
    @dish.destroy
    redirect_to dishes_path
  end


  private

  def set_dish
    @dish=Dish.find(params[:id])
  end

  def dish_params
    params.require(:dish).permit(:name,:cost,:description,:menu_id)
  end

  def require_admin_user
    if current_user.role!='admin'
      flash[:alert] = "Admin can only modify dishes"
      redirect_to @dish
    end
  end

end
