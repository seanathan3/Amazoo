class Api::ItemsController < ApplicationController

    def index
        @items = Item.all
        render 'api/items/index'
    end

    def show
        @item = Item.find(params[:id]);
        render 'api/items/show';

    end

end