class LipGlossesController < ApplicationController

 def new
    @lip_gloss = LipGloss.new 
    @lip_gloss.build_sponsor
 end 

def create
    @lip_gloss = LipGloss.new(lip_gloss_params)
    @lip_gloss.user_id = session[:user_id]
        if @lip_gloss.save
          redirect_to lip_gloss_path(@lip_gloss)
        else
          render :new
     end
end 

def index
   @lip_gloss = LipGloss.all
end

def edit
   @lip_gloss = LipGloss.find(params[:id])
 end

def show
   @lip_gloss = LipGloss.find(params[:id])
end 


 private
 
 def lip_gloss_params
    params.require(:lip_gloss).permit(:name, :price, :sponsor_id, sponsor_attributes: [:name])
 end


end
