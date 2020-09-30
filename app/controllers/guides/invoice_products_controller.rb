module Guides
  class InvoiceProductsController < ApplicationController
    def initialize
      @single_table_query = SingleTableQuery.new
      @model = InvoiceProduct
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
        code: params[:code],
        price: params[:price],
        rate_vat: RateVat.find(params[:rate_vat_id]),
        summa_nds: params[:summa_nds],
        cost: params[:cost],
        unit: Unit.find(params[:unit_id]),
        p_subgroup: PSubgroup.find(params[:p_subgroup_id]),
        invoice: Invoice.find(params[:invoice_id])
      }
    end

    def get_method_helper (el)
      {
        id: el.id,
        short_name: el.short_name,
        full_name: el.full_name,
        code: el.code,
        price: el.price,
        rate_vat: el.rate_vat,
        summa_nds: el.summa_nds,
        cost: el.cost,
        unit: el.unit,
        p_subgroup: el.p_subgroup,
        invoice: el.invoice
      }
    end

    def permit_params
      params.require(@model.name.underscore.to_sym)
      .permit(:short_name, :full_name, :code, :price, :rate_vat_id, :summa_nds,
              :cost, :unit_id, :p_subgroup_id, :invoice_id)
    end
  end
end