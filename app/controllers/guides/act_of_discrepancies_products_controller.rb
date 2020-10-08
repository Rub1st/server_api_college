module Guides
  class ActOfDiscrepanciesProductsController < ApplicationController
    def initialize
      @single_table_query = SingleTableQuery.new
      @model = ActOfDiscrepanciesProduct
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
      render json: @model.where(id: params[:id]).map{ |el| get_method_helper(el) }.first, status: :ok
    end

    private

    def invoice_product_parser(params)
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

    def post_method_helper (params)
      {
        code: params[:code],
        invoice_product: InvoiceProduct.find(params[:invoice_product_id]),
        act_of_discrepancy: ActOfDiscrepancy.find(params[:act_of_discrepancy_id])
      }
    end

    def get_method_helper (el)
      {
        code: el.code,
        invoice_product: invoice_product_parser(el.invoice_product),
        act_of_discrepancy: el.act_of_discrepancy
      }
    end

    def permit_params
      params.require(@model.name.underscore.to_sym)
      .permit(:invoice_product_id, :act_of_discrepancy_id, :code)
    end
  end
end
