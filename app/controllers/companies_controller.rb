class CompaniesController < ApplicationController
    def index
    end

    def create
        render plain: params[:company].inspect
    end
end
