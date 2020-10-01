class ReviewsController < ApplicationController

    def new
        @lip_gloss = LipGloss.find_by_id(params[:lip_gloss_id])
        @review = @lip_gloss.reviews.build
    end 

    def create 
        @review = current_user.reviews.build(review_params)
        if @review.save
             redirect_to review_path(@review)
        else
            render :new
        end
    end 
    
    def show 
      @review = Review.find_by_id(params[:id])
    end 

    def index
    end

     def review_params
        params.require(:review).permit(:lip_gloss_id, :purchase, :comment)
     end 

end
