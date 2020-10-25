module Guides
  class CostsController < ApplicationController
    def initialize
      @single_table_query = SingleTableQuery.new
      @model = Cost
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
      render json: @model.where(id: params[:id]).map{ |el| get_method_helper(el)}.first, status: :ok
    end

    private

    def invoice_product_parser(params)
      {
        id: params[:id],
        short_name: params[:short_name],
        full_name: params[:full_name],
        code: params[:code],
        price: params[:price],
        rate_vat: RateVat.find(params[:rate_vat_id]),
        summa_nds: params[:summa_nds],
        count: params[:count],
        cost: params[:cost],
        unit: Unit.find(params[:unit_id]),
        p_subgroup: PSubgroup.find(params[:p_subgroup_id]),
        invoice: Invoice.find(params[:invoice_id])
      }
    end

    def post_method_helper(params)
      p params
      invoice_product = InvoiceProduct.find(params[:invoice_product_id])
      comercial_p = params[:commercial_percent].to_f
      comercial_v = (params[:commercial_percent].to_f / 100.0) * invoice_product.price
      wholesale_p = params[:wholesale_percent].to_f
      wholesale_v = (params[:wholesale_percent].to_f / 100.0) * invoice_product.cost
      nds_p = params[:nds_percent].to_f
      nds_v = (nds_p / 100.0) * (invoice_product.price + ((comercial_p / 100.0) * invoice_product.price))
      retail_v = nds_v + invoice_product.price + comercial_v
      {
        wholesale_percent: wholesale_p,
        wholesale_value: wholesale_v,
        commercial_percent: comercial_p,
        commercial_value: comercial_v,
        nds_percent: nds_p,
        nds_value: nds_v,
        retail_price: retail_v,
        cost: retail_v * invoice_product.count,
        invoice_product: invoice_product
      }
    end

    def get_method_helper (el)
      {
        id: el.id,
        wholesale_percent: el.wholesale_percent,
        wholesale_value: el.wholesale_value,
        commercial_percent: el.commercial_percent,
        commercial_value: el.commercial_value,
        nds_percent: el.nds_percent,
        nds_value: el.nds_value,
        retail_price: el.retail_price,
        cost: el.cost,
        invoice_product: invoice_product_parser(el.invoice_product)
      }
    end

    def permit_params
      params.require(@model.name.underscore.to_sym).permit(:wholesale_percent, :commercial_percent, :nds_percent, :invoice_product_id)
    end
  end
end