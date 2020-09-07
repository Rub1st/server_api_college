module Guides
  class OrganizationsController < ApplicationController
   
    def initialize
      @single_table_query = SingleTableQuery.new
      @model = Organization
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

    def post_method_helper (params)
      {
        short_name: params[:short_name],
        full_name: params[:full_name],
        unp: params[:unp],
        legal_address: params[:legal_address],
        phone_or_fax: params[:phone_or_fax],
        email: params[:email],
        is_provider: params[:is_provider],
        is_buyer: params[:is_buyer],
        is_company: params[:is_company],
        ownership_form: OwnershipForm.find(params[:ownership_form_id])
      }
    end

    def get_method_helper (el)
      {
        id: el.id,
        short_name: el.short_name,
        full_name: el.full_name,
        unp: el.unp,
        legal_address: el.legal_address,
        phone_or_fax: el.phone_or_fax,
        email: el.email,
        is_provider: el.is_provider,
        is_buyer: el.is_buyer,
        is_company: el.is_company,
        ownership_form: el.ownership_form,
        warehouses: Warehouse.all.where(organization: el)
      } 
    end

    def permit_params
      params.require(@model.name.underscore.to_sym).permit(:short_name, :full_name, :unp, :legal_address, :phone_or_fax,
                                                           :email, :is_provider, :is_buyer, :is_company, :ownership_form_id)
    end

  end
end