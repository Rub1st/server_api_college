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

    def post_method_helper (params)
      {
        invoice_product: InvoiceProduct.find(params[:invoice_product_id]),
        act_of_discrepancy: ActOfDiscrepancy.find(params[:act_of_discrepancy_id])
      }
    end

    def get_method_helper (el)
      {
        invoice_product: el.invoice_product,
        act_of_discrepancy: el.act_of_discrepancy
      }
    end

    def permit_params
      params.require(@model.name.underscore.to_sym)
      .permit(:invoice_product_id, :act_of_discrepancy_id)
    end
  end
end
