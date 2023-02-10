class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show edit update destroy ]

  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def edit
  end

  def create
    @book = Book.find(params[:book_id])

    review = @book.reviews.new(review_params)

    if review.save 
      redirect_to @book 
    else 
      render :new, status: :unprocessable_entity
    end

  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to review_url(@review), notice: "Review was successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviews_url, notice: "Review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
