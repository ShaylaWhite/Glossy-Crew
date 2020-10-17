class ReviewsController < ApplicationController
  before_action :require_login

  def new
    if @lip_gloss = LipGloss.find_by_id(params[:lip_gloss_id])
        @review = @lip_gloss.reviews.build
      else
        @review = Review.new
      end
end

def create
  @review = Review.new(reviews_params)
  @review.user_id = session[:user_id]
      if @review.save
          redirect_to lip_glosses_path
      else
          render :new
      end
end


def show
  @review = Review.find_by_id(params[:id])

end

def edit
end

def index
    if @lip_gloss = LipGloss.find_by_id(params[:lip_gloss_id]) #nested
        @reviews = @lip_gloss.reviews
    else
        @reviews = Review.all
    end
end

private

def reviews_params
    params.require(:review).permit(:lip_gloss_id, :purchase, :comment)
end

def set_review
    @review = Review.find_by(id: params[:id])
end
end