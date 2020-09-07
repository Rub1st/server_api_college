module Customs
  class ActOfDiscrepanciesController < ApplicationController
    
    def initialize
      @single_table_query = SingleTableQuery.new
      @model = ActOfDiscrepancy
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
        invoice_type: InvoiceType.find(params[:invoice_type_id]),
        operation: Operation.find(params[:operation_id]),
        currency: Currency.find(params[:currency_id]),
        contract: Contract.find(params[:contract_id]),
        provider_warehouse: Warehouse.find(params[:provider_warehouse_id]),
        customer_warehouse: Warehouse.find(params[:customer_warehouse_id]),
        is_closed: params[:is_closed],
        is_conducted: params[:is_conducted],
        series_and_number: params[:series_and_number],
        date_and_time: params[:date_and_time],
        strings_count: params[:strings_count],
        total_count: params[:total_count],
        summa_nds: params[:summa_nds],
        summa_with_nds: params[:summa_with_nds],
        note: params[:note]
      }
    end

    def get_method_helper (el)
      {
        id: el.id,
        is_closed: el.is_closed,
        is_conducted: el.is_conducted,
        series_and_number: el.series_and_number,
        date_and_time: el.date_and_time,
        strings_count: el.strings_count,
        total_count: el.total_count,
        summa_nds: el.summa_nds,
        summa_with_nds: el.summa_with_nds,
        note: el.note,
        invoice_type: el.invoice_type,
        operation: el.operation,
        currency: el.currency,
        contract: el.contract,
        provider_warehouse: el.provider_warehouse,
        customer_warehouse: el.customer_warehouse,
      } 
    end

    def permit_params
      params.require(@model.name.underscore.to_sym).permit(:is_closed, :is_conducted, :series_and_number, :date_and_time, :strings_count,
                                                           :total_count, :summa_nds, :summa_with_nds, :note, :invoice_type_id, :operation_id,
                                                           :currency_id, :contract_id, :provider_warehouse_id, :customer_warehouse_id)
    end

  end
end