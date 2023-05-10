class Api::CartItemsController < ApplicationController
    wrap_parameters include: CartItem.attribute_names + ['userId', 'itemId']


    def index
        @cart_items = User.find(params[:user_id]).cart_items
        render :index
    end

    def create
        @cart_item = CartItem.find_by(user_id: params[:user_id], item_id: params[:item_id])
        if @cart_item
            @cart_item.quantity += params[:quantity]
        else
            @cart_item = CartItem.new(cart_item_params)
        end

        if @cart_item.save
            render :show
        else
            render json: @cart_item.errors.full_messages, status: 422
        end
    end

    def update
        @cart_item = CartItem.find(params[:id])
        if @cart_item.update(cart_item_params)
            render :show
        else
            render json: @cart_item.errors.full_messages, status: 422
        end
    end

    def destroy
        @cart_item = CartItem.find(params[:id])
        @cart_item.destroy
        render json: { message: 'successfully deleted'}
    end

    def transfer

        params[:cart_items].each do |cart_item_param|
            cart_item = CartItem.find_by(user_id: current_user.id, item_id: cart_item_param[:item_id])
            if cart_item
                cart_item.quantity += cart_item_param[:quantity]
            else
                cart_item = CartItem.new(cart_item_param.permit(:item_id, :quantity))
                cart_item.user_id = current_user.id
            end

            cart_item.save
        end


    end

    private
    def cart_item_params
        params.require(:cart_item).permit(:quantity, :user_id, :item_id)
    end


end