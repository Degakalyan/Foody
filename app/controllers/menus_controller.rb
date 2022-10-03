class MenusController < ApplicationController
  before_action :set_menu,only:[:show,:edit,:update,:destroy,:dishs]
  before_action :require_user, except: [:show, :index]
  before_action :require_admin_user, only: [:edit, :update, :destroy]

  def index
    @menus=Menu.all
  end
  def show
  end
  def new
    @menu=Menu.new
  end

  def create
    @menu=Menu.new(menu_params)
      if @menu.save
      flash[:notice]="Menu created successfully"
      redirect_to @menu
    else
      render 'new'
    end
  end
  def edit
  end
  def update
    if @menu.update(menu_params)
      flash[:notice]="Menu updated successfully"
      redirect_to @menu
    else
      render 'edit'
    end
  end
  def destroy
    @menu.destroy
    redirect_to menus_path
  end
  private
  def set_menu
    @menu=Menu.find(params[:id])
  end
  def menu_params
    params.require(:menu).permit(:name)
  end
  def require_admin_user
    if current_user.role!='admin'
      flash[:alert] = "Admin can only modify menus"
      redirect_to @menu
    end
  end
end
