# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#очистка содержимого таблиц
ActOfDiscrepancy.destroy_all
Invoice.destroy_all
Warehouse.destroy_all
InvoiceType.destroy_all
Operation.destroy_all
Agreement.destroy_all
Contract.destroy_all
Product.destroy_all
PSubgroup.destroy_all
PGroup.destroy_all
Unit.destroy_all
Organization.destroy_all
Currency.destroy_all
OwnershipForm.destroy_all
StatusOfAcceptance.destroy_all
StatusOfBootingInEquipment.destroy_all
StatusOfPriceTagPrinting.destroy_all
TypeOfContract.destroy_all
TypeOfExchange.destroy_all
TypeOfPayment.destroy_all

# переменные
variables = {
    # группы товаров
    group1: 'продовольственное',
    group2: 'непродовольственное',

    # единицы измерения
    litres: 'литры',
    items: 'штуки',
    kilos: 'килограммы',
    gramms: 'граммы',

    # валюта
    rus_rub: 'российский рубль',
    bel_rub: 'белорусский рубль',
    usa_dollar: 'доллар США',
    euro: 'евро',

    # формы собственности
    oao: 'Открытое Акционерное Общество',
    rup: 'Республиканское Унитарное Предприятие',
    chup: 'Частное Унитарное Предприятие',
    kup: 'Коммунальное Унитарное Предприятие',
    zao: 'Закрытое Акционерное общество',
    ooo: 'Общество с Ограниченной ответственностью',

    # условия оплаты
    type_of_payment1: 'предварительная оплата',
    type_of_payment2: 'отсрочка платежа',
    type_of_payment3: 'предварительный акцепт',


    # типы договоров
    type_of_contract1: 'договор поставки',
    type_of_contract2: 'договор купли-продажи',
    type_of_contract3: 'договор об оказании услуг',
    type_of_contract4: 'договор розничной купли-продажи',
    type_of_contract5: 'договор складского хранения',
    type_of_contract6: 'договор комиссии',
    type_of_contract7: 'договор перевозки грузов',

    # типы обмена
    type_of_exchange1: '',

    # статусы печати ценника
    status_of_price_tag_printing1: '',

    # статусы приемки
    status_of_acceptance1: 'ожидается приемка',
    status_of_acceptance2: 'принят',
    status_of_acceptance3: 'возврат',
    
    # статусы загрузки в оборудование
    status_of_booting_in_equipment1: 'успешно загружен',
    status_of_booting_in_equipment2: 'принят к загрузке',
    status_of_booting_in_equipment3: 'не загружен',

    # типы накладной
    invoice_type1: 'закупка',
    invoice_type2: 'возврат',

    # операции
    operation1: '',

    # соглашения
    agreement1: '',
}

# создание операций
Operation.create([{name: variables[:operation1]}])

# создание статусов печати ценника
StatusOfPriceTagPrinting.create([{name: variables[:status_of_price_tag_printing1]}])

# создание соглашений
Agreement.create([{name: variables[:agreement1]}])

# создание статусов приемки
StatusOfAcceptance.create([{name: variables[:status_of_acceptance1]}])

# создание статусов загрузки в оборудование
StatusOfBootingInEquipment.create([{name: variables[:status_of_booting_in_equipment1]}])

# создание типов обмена
TypeOfExchange.create([{name: variables[:type_of_exchange1]}])

# создание условий оплаты
TypeOfPayment.create([{name: variables[:type_of_payment1]}])

# создание типов договора
TypeOfContract.create([{name: variables[:type_of_contract1]},{name: variables[:type_of_contract2]},{name: variables[:type_of_contract3]},
                       {name: variables[:type_of_contract4]},{name: variables[:type_of_contract5]},{name: variables[:type_of_contract6]},
                       {name: variables[:type_of_contract7]}])

# создание видов форм
OwnershipForm.create([{name: variables[:oao]}, {name: variables[:rup]}, {name: variables[:chup]},
                      {name: variables[:kup]}, {name: variables[:zao]}, {name: variables[:ooo]}])

# создание типов накладной
InvoiceType.create([{name: variables[:invoice_type1]},{name: variables[:invoice_type2]}])

# создание групп товаров
PGroup.create([{ name: variables[:group1] }, { name: variables[:group2] }])

# создание видов валют
Currency.create([{ short_name: '₽', full_name: variables[:rus_rub] },
                 { short_name: 'Br', full_name: variables[:bel_rub] },
                 { short_name: '$', full_name: variables[:usa_dollar] },
                 { short_name: '€', full_name: variables[:euro] }])

# запросы на названия групп товаров
food = PGroup.find_by(name: variables[:group1])
unfood = PGroup.find_by(name: variables[:group2])

# создание подгрупп товаров
PSubgroup.create([{ p_group: food, name: 'молочные товары' },
                  { p_group: food, name: 'кисло-молочные' }])

# создание единиц измерения
Unit.create([{ short_name: 'л.', full_name: variables[:litres] },
             { short_name: 'шт.', full_name: variables[:items] },
             { short_name: 'кг', full_name: variables[:kilos] },
             { short_name: 'г.', full_name: variables[:gramms] }])

# запросы на названия единиц измерения
f_liters = Unit.find_by(full_name: variables[:litres])
f_gramms = Unit.find_by(full_name: variables[:gramms])

# создание продуктов
Product.create([{ short_name: 'Молоко «Любимое»', full_name: 'Молоко «Любимое» 1,5%', unit: f_liters },
                { short_name: 'Кефир «Деревенский»', full_name: 'Кефир «Деревенский» 2,5%', unit: f_liters },
                { short_name: 'Сметана «Вкусная» 25%', full_name: 'Сметана «Вкусная» 25%', unit: f_gramms }])

# создание организаций
Organization.create([{ ownership_form: OwnershipForm.find_by(name: variables[:ooo]), short_name: '«Молочный мир»', full_name: 'OOO «Молочный мир»', unp: '567456998', legal_address: 'Независимости 35, 23', is_provider: true, is_buyer: false, is_company: true},
                     { ownership_form: OwnershipForm.find_by(name: variables[:zao]), short_name: '«Златка»', full_name: 'ЧТУП «Златка»', unp: '237456998', legal_address: 'Якубовского 78, 93', is_provider: false, is_buyer: true, is_company: true}])

# создание контракта
Contract.create([{currency: Currency.find_by(full_name: variables[:usa_dollar]),
                  type_of_exchange: TypeOfExchange.find_by(name: ''),
                  type_of_contract: TypeOfContract.find_by(name: variables[:type_of_contract3]),
                  type_of_payment: TypeOfPayment.find_by(name: variables[:type_of_payment1]),
                  provider: Organization.where(is_provider: true).take,
                  customer: Organization.where(is_buyer: true).take,
                  series_and_number: '123456789'}])

# создание складов
Warehouse.create([{address: 'Красноармейская 7а', organization: Organization.find_by(short_name: '«Молочный мир»')},
                  {address: 'Неманская 17, 32', organization: Organization.find_by(short_name: '«Златка»')}])

#создание накладной
Invoice.create(invoice_type: InvoiceType.find_by(name: variables[:invoice_type1]),
               operation: Operation.find_by(name: variables[:operation1]),
               currency: Currency.find_by(full_name: variables[:usa_dollar]),
               contract: Contract.find_by(series_and_number: '123456789'),
               agreement: Agreement.find_by(name: variables[:agreement1]),
               status_of_price_tag_printing: StatusOfPriceTagPrinting.find_by(name: variables[:status_of_price_tag_printing1]),
               status_of_acceptance: StatusOfAcceptance.find_by(name: variables[:status_of_acceptance1]),
               status_of_booting_in_equipment: StatusOfBootingInEquipment.find_by(name: variables[:status_of_booting_in_equipment1]))

# создание актов расхождений
ActOfDiscrepancy.create(invoice_type: InvoiceType.find_by(name: variables[:invoice_type1]),
                          operation: Operation.find_by(name: variables[:operation1]),
                          currency: Currency.find_by(full_name: variables[:usa_dollar]),
                          contract: Contract.find_by(series_and_number: '123456789'),
                          provider_warehouse: Warehouse.find_by(organization: Organization.find_by(short_name: '«Молочный мир»')),
                          customer_warehouse: Warehouse.find_by(organization: Organization.find_by(short_name: '«Златка»')))

# добавление в b_subgroups_products
Product.find_by_short_name('Молоко «Любимое»')
       .p_subgroups << [PSubgroup.find_by(p_group: food, name: 'молочные товары'),
                        PSubgroup.find_by(p_group: food, name: 'кисло-молочные')]

# добавление в contracts_products
# Contract.find_by(series_and_number: '123456789')
#        .products << [Product.find_by(short_name: 'Молоко «Любимое»', full_name: 'Молоко «Любимое» 1,5%'),
#                      Product.find_by(short_name: 'Кефир «Деревенский»', full_name: 'Кефир «Деревенский» 2,5%')]