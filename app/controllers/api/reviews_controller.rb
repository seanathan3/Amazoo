class Api::ReviewsController < ApplicationController
    wrap_parameters include: Review.attribute_names + ['commenterId', 'itemId']

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

    def update
        @review = Review.find(params[:id])
        if @review.update(review_params)
            render :show
        else
            render json: @review.errors.full_messages, status: 422
        end
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        render json: { message: 'successfully deleted' }
    end

    def show
        @review = Review.find(params[:id])
        render :show
    end


    private
    def review_params
        params.require(:review).permit(:rating, :body, :title, :commenter_id, :item_id)
    end
end