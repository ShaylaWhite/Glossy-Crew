class ReviewsController < ApplicationController

    def new
        @lip_gloss = LipGloss.find_by_id(params[:lip_gloss_id])
        @review = @lip_gloss.reviews.build
    end 

    def create 
        @review = Review.new(review_params)
        if @review.save
             redirect_to review_path(@review)
        else
            render :new
        end
    end 
    
    def show 
      @review.ice_cream
    end 

     def review_params
        params.require(:review).permit(:lip_gloss_id, :purchase, :comment)
     end 

end
