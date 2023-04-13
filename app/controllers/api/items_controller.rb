class Api::ItemsController < ApplicationController

    def index
        @items = Item.all
        render :index
    end

    def show
        @item = Item.find(params[:id])
        render :show
    end

    def search
        @items  = Item.where("name iLIKE '%#{params[:query]}%' OR animal_type iLIKE '%#{params[:query]}%'")
        render :index
    end

end