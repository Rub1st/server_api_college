Rails.application.routes.draw do

  $utils = ['invoice_types']
  $routes = [ 'new', 'create', 'update', 'edit', 'destroy', 'index', 'show']
  $guides = ['invoice_products','act_of_discrepancies_products','rate_ndses','units', 'p_subgroups', 'p_groups', 'organizations', 'products', 'currencies', 'ownership_forms']
  $customs = ['act_of_discrepancies', 'invoices', 'operations', 'agreements', 'status_of_price_tag_printings', 'status_of_booting_in_equipments', 'status_of_acceptances']
  $warehouses = ['warehouses', 'contracts', 'type_of_payments', 'type_of_exchanges', 'type_of_contracts']
  
  namespace :utils do
    resources *$utils.map{|entity| entity.to_sym}
  end

  $utils.map{|entity| $routes.map{|route| get "/utils/#{entity}/#{route}"}}

  namespace :guides do
    resources *$guides.map{|entity| entity.to_sym}
  end

  $guides.map{|entity| $routes.map{|route| get "/guides/#{entity}/#{route}"}}


  namespace :customs do
    resources *$customs.map{|entity| entity.to_sym}
  end

  $customs.map{|entity| $routes.map{|route| get "/customs/#{entity}/#{route}"}}


  namespace :warehouses do
    resources *$warehouses.map{|entity| entity.to_sym}
  end

  $warehouses.map{|entity| $routes.map{|route| get "/warehouses/#{entity}/#{route}"}}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
