class LipGlossesController < ApplicationController
   before_action :set_lip_gloss, only: [:edit, :update, :show, :destroy]

  
   before_action :require_login

 

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
   
         @lip_glosses = LipGloss.order_by_review
   end

   def show
      @reviews = @lip_gloss.reviews

   end 

   def edit

 end

   def update
      if @lip_gloss.update(lip_gloss_params)
          redirect_to lip_glosses_path
      else
          render :edit
      end
end

def destroy 
      @lip_gloss.destroy
      redirect_to lip_glosses_path
      flash[:notice] = "You have successfully deleted Lip Gloss."
end

   private
   
   def lip_gloss_params
      params.require(:lip_gloss).permit(:name, :price, :sponsor_id, sponsor_attributes: [:name])
   end

   def set_lip_gloss
      @lip_gloss = LipGloss.find_by(id: params[:id])
   end

end
