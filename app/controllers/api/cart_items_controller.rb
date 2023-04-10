class Api::CartItemsController < ApplicationController
    wrap_parameters include: CartItem.attribute_names + ['userId', 'itemId']


    def index
        @cart_items = User.find(params[:user_id]).cart_items
        render :index
    end

    def create
        @cart_item = CartItem.new(cart_item_params)
        @cart_item.save!
        render :show
    end

    def update
    end

    def destroy
    end

    private
    def cart_item_params
        params.require(:cart_item).permit(:quantity, :user_id, :item_id)
    end


end