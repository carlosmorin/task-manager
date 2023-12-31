# frozen_string_literal: true

module Api
  module V1
    # CategoriesController
    class CategoriesController < ApplicationController
      before_action :set_category, only: %i[show update destroy]
      before_action :set_params, only: %i[index]

      def index
        @categories = Category.paginate(page: @page, per_page: @per_page).ordering(@order.to_sym).filter_by_name(@query)

        render json: @categories
      end

      def show
        render json: @category, show_tasks: true
      end

      def create
        @category = Category.new(category_params)

        if @category.save
          render json: @category, show_tasks: true, status: :created
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end

      def update
        if @category.update(category_params)
          render json: @category, show_tasks: true
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @category.destroy
      end

      private

      def set_category
        @category = Category.find(params[:id])
      end

      def category_params
        params.require(:category).permit(:name, :description, tasks_attributes: tasks_attributes)
      end

      def tasks_attributes
        %i[id name description due_date _destroy]
      end

      def set_params
        @order = params[:order].present? ? Regexp.escape(params[:order]) : 'asc'
        @query = params[:query].present? ? Regexp.escape(params[:query]) : nil
        @page = params[:page]
        @per_page = params[:per_page]
      end
    end
  end
end
