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
        debugger
        @items  = Item.where("name === 'Yak'")
        render :index
    end

end