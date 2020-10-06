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

    def invoice_parser (invoice)
      {
        series_and_number: invoice.series_and_number,
        note: invoice.note,
        is_closed: invoice.is_closed,
        is_conducted: invoice.is_conducted,
        date_and_time: invoice.date_and_time,
        selling_on_commission: invoice.selling_on_commission,
        strings_count: invoice.strings_count,
        total_count: invoice.total_count,
        summa: invoice.summa,
        summa_nds: invoice.summa_nds,
        summa_with_nds: invoice.summa_with_nds,
        record_summa: invoice.record_summa,
        retail_summa: invoice.retail_summa,
        pre_assessment_summa: invoice.pre_assessment_summa,
        write_down_summa: invoice.write_down_summa,
        invoice_type: InvoiceType.find(invoice.invoice_type_id),
        operation: Operation.find(invoice.operation_id),
        contract: Contract.find(invoice.contract_id),
        agreement: Agreement.find(invoice.agreement_id),
        currency: Currency.find(invoice.currency_id),
        status_of_acceptance: StatusOfAcceptance.find(invoice.status_of_acceptance_id),
        status_of_booting_in_equipment: StatusOfBootingInEquipment.find(invoice.status_of_booting_in_equipment_id),
        status_of_price_tag_printing: StatusOfPriceTagPrinting.find(invoice.status_of_price_tag_printing_id)
      }
    end

    def post_method_helper (params)
      {
        invoice_type: InvoiceType.find(params[:invoice_type_id]),
        operation: Operation.find(params[:operation_id]),
        currency: Currency.find(params[:currency_id]),
        invoice: Invoice.find(params[:invoice_id]),
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
        invoice: invoice_parser(el.invoice),
        provider_warehouse: el.provider_warehouse,
        customer_warehouse: el.customer_warehouse
      }
    end

    def permit_params
      params.require(@model.name.underscore.to_sym).permit(:is_closed, :is_conducted, :series_and_number, :date_and_time, :strings_count,
                                                           :total_count, :summa_nds, :summa_with_nds, :note, :invoice_type_id, :operation_id,
                                                           :currency_id, :invoice_id, :provider_warehouse_id, :customer_warehouse_id)
    end

  end
end