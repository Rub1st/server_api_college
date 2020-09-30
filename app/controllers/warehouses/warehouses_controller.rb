module Warehouses
  class WarehousesController < ApplicationController
    def initialize
      @single_table_query = SingleTableQuery.new
      @model = Warehouse
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
      warehouse = @model.find_each.map{|el| {id: el.id, address: el.address, organization: el.organization}}
      render json: warehouse, status: :ok
    end

    def show
      warehouse = @model.where(params[:id]).map{|el| {id: el.id, address: el.address, organization: el.organization}}
      render json: warehouse, status: 201
    end

    private

    def post_method_helper(params)
      {
        address: params[:address],
        organization: Organization.find(params[:organization_id])
      }
    end

    def permit_params
      params.require(@model.name.underscore.to_sym).permit(:address, :organization_id)
    end
  end
end
