class ReviewsController < ApplicationController
  before_action :set_review, only:[:show]
  before_action :require_user, only: [:create, :show, :index, :destroy]

  def index
    @reviews= Review.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review =  Review.new(review_params)
     @review.save
      redirect_to restaurants_path, notice: "Your Review is Updated."
    end

  def destroy
    @review.destroy
    redirect_to reviews_path
  end
  private
  def set_review
    @review= Review.find(params[:id])
  end


  private

  def review_params
    params.require(:review).permit(:review, :rating)
  end

  def require_user
    if current_user.role != 'user'
      flash[:alert] = "User can only write reviews"
      redirect_to @review
    end
  end

end
