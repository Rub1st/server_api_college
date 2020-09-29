module Guides
  class RateVatsController < ApplicationController
    def initialize
      @single_table_query = SingleTableQuery.new
      @model = RateVat
    end

    def create
      render @single_table_query.create(@model, post_method_helper(permit_params))
    end

    def update
      render @single_table_query.update(@model,permit_params, params[:id])
    end

    def destroy
      render @single_table_query.destroy(@model, params[:id])
    end

    def index
      render json: @model.find_each.map{ |el| get_method_helper(el) }, status: :ok
    end

    def show
      render json: @model.where(id: params[:id]).map{|el| get_method_helper(el)}.first, status: :ok
    end

    private

    def post_method_helper(params)
      {
        rate: params[:rate]
      }
    end

    def get_method_helper(el)
      {
        id: el.id,
        rate: el.rate
      }
    end

    def permit_params
      params.require(@model.name.underscore.to_sym).permit(:rate)
    end
  end
end
