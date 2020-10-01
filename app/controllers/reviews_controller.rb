class ReviewsController < ApplicationController

    def new
        @lip_gloss = LipGloss.find_by_id(params[:lip_gloss_id])
        @review = @lip_gloss.reviews.build
    end 

    def index
    end 
    



end
