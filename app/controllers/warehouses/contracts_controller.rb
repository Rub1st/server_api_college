module Warehouses
  class ApplicationController < ActionController::API
    include ActionController::MimeResponds
  end

  class ContractsController < ApplicationController

    def initialize
      @single_table_query = SingleTableQuery.new
      @model = Contract
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
      render json: @model.find_each.map{ |el| get_method_helper(el)}, status: :ok
    end

    def show
      render json: @model.where(id: params[:id]).map{|el| get_method_helper(el)}.first, status: :ok
    end

    def export_pdf
      respond_to do |format|
        format.html
        format.pdf do
          render template: 'contracts/report.pdf.erd',
          pdf: "#{@contract.series_and_number}" + Time.now.strftime('%v %H:%M:%S').to_s,
          orientation: "Landscape", encoding: "UTF-8",
          layout: 'pdf.html.erb'
        end
      end
    end

    private

    def post_method_helper (params)
      {
        currency: Currency.find(params[:currency_id]),
        type_of_exchange: TypeOfExchange.find(params[:type_of_exchange_id]),
        type_of_contract: TypeOfContract.find(params[:type_of_contract_id]),
        type_of_payment: TypeOfPayment.find(params[:type_of_payment_id]),
        provider: Organization.where(is_provider: true).find(params[:provider_id]),
        customer: Organization.where(is_buyer: true).find(params[:customer_id]),
        series_and_number: params[:series_and_number],
        valid_from: params[:valid_from],
        valid_for: params[:valid_for],
        note: params[:note]
      }
    end

    def get_method_helper (el)
      {
        id: el.id,
        series_and_number: el.series_and_number,
        valid_from: el.valid_from,
        valid_for: el.valid_for,
        note: el.note,
        currency: el.currency,
        type_of_contract: el.type_of_contract,
        type_of_exchange: el.type_of_exchange,
        type_of_payment: el.type_of_payment,
        provider: el.provider,
        customer: el.customer
      }
    end

    def permit_params
      params.require(@model.name.underscore.to_sym).permit(:series_and_number, :valid_from, :valid_for, :note,
                                                           :type_of_contract_id, :type_of_exchange_id, :type_of_payment_id,
                                                           :provider_id, :customer_id, :currency_id)
    end

  end
end