class Api::ReviewsController < ApplicationController

    def index
        @reviews = Item.find(params[:item_id]).reviews
        render :index
    end

    def create
        @review = Review.new(review_params)
        if @review.save
            render :show
        else
            render json: @review.errors.full_messages, status: 422
        end
    end

    private
    def review_params
        params.require(:review).permit(:rating, :body, :commenter_id, :item_id)
    end
end