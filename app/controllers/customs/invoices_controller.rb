module Customs
  class InvoicesController < ApplicationController

    def initialize
      @single_table_query = SingleTableQuery.new
      @model = Invoice
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

    def contract_parser (contract)
      {
        id: contract.id,
        series_and_number: contract.series_and_number,
        valid_for: contract.valid_for,
        valid_from: contract.valid_from,
        note: contract.note,
        currency: Currency.find(contract.currency_id),
        type_of_exchange: TypeOfExchange.find(contract.type_of_exchange_id),
        type_of_payment: TypeOfPayment.find(contract.type_of_payment_id),
        type_of_contract: TypeOfContract.find(contract.type_of_contract_id),
        provider: Organization.find(contract.provider_id),
        customer: Organization.find(contract.customer_id)
      }
    end

    def post_method_helper (params)
      {
        invoice_type: InvoiceType.find(params[:invoice_type_id]),
        operation: Operation.find(params[:operation_id]),
        currency: Currency.find(params[:currency_id]),
        contract: Contract.find(params[:contract_id]),
        agreement: Agreement.find(params[:agreement_id]),
        status_of_price_tag_printing: StatusOfPriceTagPrinting.find(params[:status_of_price_tag_printing_id]),
        status_of_acceptance: StatusOfAcceptance.find(params[:status_of_acceptance_id]),
        status_of_booting_in_equipment: StatusOfBootingInEquipment.find(params[:status_of_booting_in_equipment_id]),
        is_closed: params[:is_closed],
        is_conducted: params[:is_conducted],
        series_and_number: params[:series_and_number],
        date_and_time: params[:date_and_time],
        strings_count: params[:strings_count],
        total_count: params[:total_count],
        summa_nds: params[:summa_nds],
        summa_with_nds: params[:summa_with_nds],
        note: params[:note],
        selling_on_commission: params[:selling_on_commission],
        summa: params[:summa],
        retail_summa: params[:retail_summa],
        record_summa: params[:record_summa],
        pre_assessment_summa: params[:pre_assessment_summa],
        write_down_summa: params[:write_down_summa]
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
        selling_on_commission: el.selling_on_commission,
        summa: el.summa,
        retail_summa: el.retail_summa,
        record_summa: el.record_summa,
        pre_assessment_summa: el.pre_assessment_summa,
        write_down_summa: el.write_down_summa,
        invoice_type: el.invoice_type,
        operation: el.operation,
        currency: el.currency,
        contract: contract_parser(el.contract),
        agreement: el.agreement,
        status_of_price_tag_printing: el.status_of_price_tag_printing,
        status_of_acceptance: el.status_of_acceptance,
        status_of_booting_in_equipment: el.status_of_booting_in_equipment
      }
    end

    def permit_params
      params.require(@model.name.underscore.to_sym).permit(:is_closed, :is_conducted, :series_and_number, :date_and_time, :strings_count,
                                                           :total_count, :summa_nds, :summa_with_nds, :note, :selling_on_commission,
                                                           :summa, :record_summa, :retail_summa, :pre_assessment_summa, :write_down_summa,
                                                           :invoice_type_id, :operation_id, :currency_id, :contract_id, :agreement_id,
                                                           :status_of_price_tag_printing_id, :status_of_acceptance_id,
                                                           :status_of_booting_in_equipment_id)
    end

  end
end