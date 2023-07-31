class Api::V1::CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show update destroy ]

  # GET /categories
  def index
    @categories = Category.all

    filter_by_name if params[:query].present?
    
    render json: @categories
  end

  # GET /categories/1
  def show
    render json: @category, show_tasks: true
  end

  # POST /categories
  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category, show_tasks: true, status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      render json: @category, show_tasks: true
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :description,
        tasks_attributes: [:id, :name, :description, :due_date, :_destroy]
      )
    end

    def filter_by_name
      query = params[:query]
      @categories = @categories.where("name LIKE ?", "%#{query}%")
    end
end
