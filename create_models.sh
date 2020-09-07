#!/bin/bash

# rails generate model InvoiceType name:string --force
# rails generate model Operation name:string --force
# rails generate model Agreement name:string --force
# rails generate model StatusOfPriceTagPrinting name:string --force
# rails generate model StatusOfAcceptance name:string --force
# rails generate model StatusOfBootingInEquipment name:string --force
# rails generate model Unit short_name:string full_name:string --force
# rails generate model Currency short_name:string full_name:string --force
# rails generate model TypeOfExchange name:string --force
# rails generate model TypeOfPayment name:string --force
# rails generate model TypeOfContract name:string --force
# rails g model OwnershipForm name:string --force

# rails generate model Product full_name:string short_name:string code:string price:double rate_nds:double summa_nds:double cost:double unit:references --forc
# rails g model PGroup name:string --force
# rails g model PSubgroup name:string p_group:references --force
# rails g migration CreateJoinTableProductsPSubgroups p_subgroups products --force

# rails generate model Organization short_name:string:null:false full_name:string unp:string legal_address:string phone_or_fax:string email:string is_provider:boolean is_buyer:boolean is_company:boolean ownership_form:references --force
# rails g model Warehouse address:string organization:references --force

# rails generate model Contract series_and_number:string valid_from:date valid_for:date by_default:boolean note:text currency:references type_of_exchange:references type_of_payment:references type_of_contract:references --force
#rails g migration CreateJoinTableContractProduct contracts products --force

# rails generate model Invoice is_closed:boolean is_conducted:boolean series_and_number:string date_and_time:datetime selling_on_commission:boolean strings_count:int total_count:int summa:double summa_nds:double summa_with_nds:double record_summa:double retail_summa:double pre_assessment_summa:double write_down_summa:double note:string invoice_type:references operation:references currency:references contract:references agreement:references status_of_price_tag_printing:references status_of_acceptance:references status_of_booting_in_equipment:references --force

# rails g model ActOfDiscrepancy is_closed:boolean is_conducted:boolean series_and_number:string date_and_time:datetime strings_count:integer total_count:integer summa_nds:float summa_with_nds:float note:string invoice_type:references operation:references currency:references contract:references --force


# rails g controller ActOfDiscrepanciesController new create update edit destroy index show
# rails g controller guides/AgreementsController new create update edit destroy index show
# rails g controller ContractsController new create update edit destroy index show
# rails g controller CurrenciesController new create update edit destroy index show
# rails g controller InvoicesController new create update edit destroy index show
# rails g controller InvoiceTypesController new create update edit destroy index show
# rails g controller OperationsController new create update edit destroy index show
# rails g controller OrganizationsController new create update edit destroy index show
# rails g controller OwnershipFormsController new create update edit destroy index show
# rails g controller PGroupsController new create update edit destroy index show
# rails g controller PSubgroupsController new create update edit destroy index show
# rails g controller ProductsController new create update edit destroy index show
# rails g controller StatusOfAcceptancesController new create update edit destroy index show
# rails g controller StatusOfBootingInEquipmentsController new create update edit destroy index show
# rails g controller StatusOfPriceTagPrintingsController new create update edit destroy index show
# rails g controller TypeOfContractsController new create update edit destroy index show
# rails g controller TypeOfExchangesController new create update edit destroy index show
# rails g controller TypeOfPaymentsController new create update edit destroy index show
# rails g controller UnitsController new create update edit destroy index show
# rails g controller WarehousesController new create update edit destroy index show

#rails g migration AddIndexToPGroup

rails g migration AddIndexToPSubgroup