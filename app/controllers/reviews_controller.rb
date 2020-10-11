class ReviewsController < ApplicationController


  def new
    if @lip_gloss = LipGloss.find_by_id(params[:lip_gloss_id])
        @review = @lip_gloss.reviews.build
      else
        @review = Review.new
      end
end

def create
  @review = current_user.reviews.build(reviews_params)
  if @review.save
    redirect_to review_path(@review)
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