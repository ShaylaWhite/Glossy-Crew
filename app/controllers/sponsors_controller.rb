class SponsorsController < ApplicationController

    before_action :require_login
    
    def index
        @sponsors = Sponsor.all
    end 
end
