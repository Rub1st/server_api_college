module Guides
  class ProductsController < ApplicationController
 
    def initialize
      @single_table_query = SingleTableQuery.new
      @model = Product
    end

    def create
      render @single_table_query.create(@model, post_method_helper(permit_params))
    end

    def update
      render @single_table_query.update(@model, permit_params, params[:id])
    end

    def destroy
      render @single_table_query.destroy( @model, params[:id])
    end

    def index
      render json: @model.find_each.map{|el| get_method_helper(el)}, status: :ok
    end

    def show
      render json: @model.where(id: params[:id]).map{|el| get_method_helper(el)}.first, status: :ok
    end

    private

    def post_method_helper (props)
      {
        short_name: params[:short_name],
        full_name: params[:full_name],
        code: params[:code],
        rate_nds: params[:rate_nds],
        summa_nds: params[:summa_nds],
        cost: params[:cost],
        unit: Unit.find(params[:unit_id])
      }
    end

    def get_method_helper (el)
      {
        id: el.id,
        short_name: el.short_name,
        full_name: el.full_name,
        code: el.code,
        rate_nds: el.rate_nds,
        summa_nds: el.summa_nds,
        cost: el.cost,
        unit: el.unit,
      } 
    end

    def permit_params
      params.require(@model.name.underscore.to_sym).permit(:short_name, :full_name, :code, :rate_nds, :summa_nds,
                                                           :cost, :unit_id)
    end

  end
end