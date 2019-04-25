class ReviewsController < ApplicationController
    def show
        
    end

    def create
        @product = Product.find params[:product_id]
        @specreview = Review.new(
            rating: params[:review][:rating],
            description: params[:review][:description],
            product_id: @product.id,
            user: current_user
        )
        
        if @specreview.save
        @product.reviews << @specreview
        redirect_to product_path(params[:product_id])
        else
        puts @specreview.errors.full_messages
        end
    end
    
end







# find parent mode
# use has_many association to intialize the child instance
#attempt save if successful redirect to appropriate apge
#else render to wher ethe form resides

# after @review has been initialized, but before calling .save on it:
# @review.user = current_user