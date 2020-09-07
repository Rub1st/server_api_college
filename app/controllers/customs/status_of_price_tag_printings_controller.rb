module Customs
  class StatusOfPriceTagPrintingsController < ApplicationController

    def initialize
      @single_table_query = SingleTableQuery.new
      @model = StatusOfPriceTagPrinting
    end

    def create
      render @single_table_query.create(@model, permit_params) 
    end

    def update
      render @single_table_query.update(@model,permit_params, params[:id])
    end

    def destroy
      render @single_table_query.destroy(@model, params[:id])
    end

    def index
      render @single_table_query.index(@model)
    end

    def show
      render @single_table_query.show(@model,params[:id])
    end

    private

    def permit_params
      params.require(@model.name.underscore.to_sym).permit(:name)
    end

  end
end