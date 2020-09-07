module Guides
  class PSubgroupsController < ApplicationController
  
    def initialize
      @single_table_query = SingleTableQuery.new
      @model = PSubgroup
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
      p_subgroup = @model.find_each.map{|el| get_method_helper(el)}
      render json: p_subgroup, status: :ok
    end

    def show
      p_subgroup = @model.where(id: params[:id]).map{|el| get_method_helper(el)}
      render json: p_subgroup, status: 201
    end

    private

    def post_method_helper (params)
      {
        name: params[:name],
        p_group: PGroup.find(params[:p_group_id]),
      }
    end

    def get_method_helper (el)
      {
        id: el.id,
        name: el.name,
        p_group: el.p_group,
      } 
    end

    def permit_params
      params.require(@model.name.underscore.to_sym).permit(:name, :p_group_id)
    end

  end
end
