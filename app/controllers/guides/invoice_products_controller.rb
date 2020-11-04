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
      this_invoice = Invoice.find(params[:invoice_id])
      rate_vat = RateVat.find(params[:rate_vat_id])
      cost = params[:price].to_f * params[:count].to_f
      summa_nds = cost * (rate_vat.rate.to_f / 100.0)
      {
        short_name: params[:short_name],
        full_name: params[:full_name],
        code: params[:code],
        count: params[:count],
        price: params[:price],
        rate_vat: rate_vat,
        summa_nds: summa_nds,
        cost: cost,
        cost_with_nds: summa_nds + cost,
        unit: Unit.find(params[:unit_id]),
        p_subgroup: PSubgroup.find(params[:p_subgroup_id]),
        invoice: this_invoice
      }
    end

    def get_method_helper (el)
      {
        id: el.id,
        short_name: el.short_name,
        full_name: el.full_name,
        code: el.code,
        count: el.count,
        price: el.price,
        rate_vat: el.rate_vat,
        summa_nds: el.summa_nds,
        cost: el.cost,
        cost_with_nds: el.cost_with_nds,
        unit: el.unit,
        p_subgroup: el.p_subgroup,
        invoice: el.invoice,
        invoice_date: el.invoice.date_and_time
      }
    end

    def permit_params
      params.require(@model.name.underscore.to_sym).permit(:short_name, :full_name, :code, :price, :rate_vat_id,
                                                           :unit_id, :p_subgroup_id, :invoice_id, :count)
    end
  end
end