module Guides
  class UnitsController < ApplicationController

    def initialize
      @single_table_query = SingleTableQuery.new
      @model = Unit
    end

    def create 
      render @single_table_query.create(@model, permit_params)
    end
    
    def update
      render @single_table_query.update(@model,permit_params, params[:id])
    end

    def destroy
      render @single_table_query.destroy( @model, params[:id])
    end

    def index
      currency = @model.find_each.map{|el| get_method_helper(el)}
      render json: currency, status: :ok
    end

    def show
      currency = @model.where(params[:id]).map{|el| get_method_helper(el)}
      render json: currency, status: 201
    end

    private

    def get_method_helper (el)
      {
        id: el.id,
        short_name: el.short_name,
        full_name: el.full_name,
        gramms: el.gramms
      } 
    end

    def permit_params
      params.require(@model.name.underscore.to_sym).permit(:short_name,:full_name, :gramms)
    end

  end
end