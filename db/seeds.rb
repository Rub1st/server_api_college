# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# destroy data
ActOfDiscrepanciesProduct.destroy_all
InvoiceProduct.destroy_all
ActOfDiscrepancy.destroy_all
Invoice.destroy_all
Warehouse.destroy_all
InvoiceType.destroy_all
Operation.destroy_all
Agreement.destroy_all
Contract.destroy_all
RateVat.destroy_all
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

# variables
variables = {
  # product groups
  group1: 'продовольственное',
  group2: 'непродовольственное',

  # units
  litres: 'литры',
  items: 'штуки',
  kilos: 'килограммы',
  gramms: 'граммы',

  # currencies
  rus_rub: 'российский рубль',
  bel_rub: 'белорусский рубль',
  usa_dollar: 'доллар США',
  euro: 'евро',

  # ownership forms
  oao: 'Открытое Акционерное Общество',
  rup: 'Республиканское Унитарное Предприятие',
  chup: 'Частное Унитарное Предприятие',
  kup: 'Коммунальное Унитарное Предприятие',
  zao: 'Закрытое Акционерное общество',
  ooo: 'Общество с Ограниченной ответственностью',

  # type of payments
  type_of_payment1: 'предварительная оплата',
  type_of_payment2: 'отсрочка платежа',
  type_of_payment3: 'предварительный акцепт',

  # type of contracts
  type_of_contract1: 'договор поставки',
  type_of_contract2: 'договор купли-продажи',
  type_of_contract3: 'договор об оказании услуг',
  type_of_contract4: 'договор розничной купли-продажи',
  type_of_contract5: 'договор складского хранения',
  type_of_contract6: 'договор комиссии',
  type_of_contract7: 'договор перевозки грузов',

  # type of exchanges
  type_of_exchange1: 'натуральный',

  # statuses of price tag printing
  status_of_price_tag_printing1: 'ожидание',

  # statuses of acceptance
  status_of_acceptance1: 'ожидается приемка',
  status_of_acceptance2: 'принят',
  status_of_acceptance3: 'возврат',

  # statuses of booting in equipment
  status_of_booting_in_equipment1: 'успешно загружен',
  status_of_booting_in_equipment2: 'принят к загрузке',
  status_of_booting_in_equipment3: 'не загружен',

  # types of invoice
  invoice_type1: 'закупка',
  invoice_type2: 'возврат',

  # operations
  operation1: 'взаимовыплаты',

  # agreements
  agreement1: 'честный'
}

RateVat.create([{ rate: 10 }, { rate: 20 }])

# creating operations
Operation.create([{ name: variables[:operation1] }])

# creating statuses of price tag printing
StatusOfPriceTagPrinting.create([{ name: variables[:status_of_price_tag_printing1] }])

# creating agreements
Agreement.create([{ name: variables[:agreement1] }])

# creating statuses of acceptanse
StatusOfAcceptance.create([{ name: variables[:status_of_acceptance1] }])

# creating statuses of booting in equipment
StatusOfBootingInEquipment.create([{ name: variables[:status_of_booting_in_equipment1] }])

# creating types of exchange
TypeOfExchange.create([{ name: variables[:type_of_exchange1] }])

# creating types of payment
TypeOfPayment.create([{ name: variables[:type_of_payment1] }])

# creating types of contract
TypeOfContract.create([
                        { name: variables[:type_of_contract1] },
                        { name: variables[:type_of_contract2] },
                        { name: variables[:type_of_contract3] },
                        { name: variables[:type_of_contract4] },
                        { name: variables[:type_of_contract5] },
                        { name: variables[:type_of_contract6] },
                        { name: variables[:type_of_contract7] }
                      ])

# creating ownership forms
OwnershipForm.create([
                       { name: variables[:oao] },
                       { name: variables[:rup] },
                       { name: variables[:chup] },
                       { name: variables[:kup] },
                       { name: variables[:zao] },
                       { name: variables[:ooo] }
                     ])

# creating invoice types
InvoiceType.create([
                     { name: variables[:invoice_type1] },
                     { name: variables[:invoice_type2] }
                   ])

# creating product groups
PGroup.create([{ name: variables[:group1] }, { name: variables[:group2] }])

# creating currencies
Currency.create([{ short_name: '₽', full_name: variables[:rus_rub] },
                 { short_name: 'Br', full_name: variables[:bel_rub] },
                 { short_name: '$', full_name: variables[:usa_dollar] },
                 { short_name: '€', full_name: variables[:euro] }])

# creating queries on groups
food = PGroup.find_by(name: variables[:group1])
# unfood = PGroup.find_by(name: variables[:group2])

# creating product subgroups
PSubgroup.create([{ p_group: food, name: 'молочные товары' },
                  { p_group: food, name: 'кисло-молочные' }])

# creating units
Unit.create([{ short_name: 'л.', full_name: variables[:litres], gramms: 1000 },
             { short_name: 'шт.', full_name: variables[:items], gramms: 20_000 },
             { short_name: 'кг', full_name: variables[:kilos], gramms: 1000 },
             { short_name: 'г.', full_name: variables[:gramms], gramms: 1 }])

# creating queries on units
f_liters = Unit.find_by(full_name: variables[:litres])
# f_gramms = Unit.find_by(full_name: variables[:gramms])

# creating organizations
Organization.create([
                      {
                        ownership_form: OwnershipForm.find_by(name: variables[:ooo]),
                        short_name: '«Молочный мир»',
                        full_name: 'OOO «Молочный мир»',
                        unp: '567456998',
                        legal_address: 'Независимости 35, 23',
                        is_provider: true,
                        is_buyer: false,
                        is_company: true
                      },
                      {
                        ownership_form: OwnershipForm.find_by(name: variables[:zao]),
                        short_name: '«Златка»',
                        full_name: 'ЧТУП «Златка»',
                        unp: '237456998',
                        legal_address: 'Якубовского 78, 93',
                        is_provider: false,
                        is_buyer: true,
                        is_company: true
                      }
                    ])

# creating contracts
Contract.create(series_and_number: '123456789',
                valid_from: nil,
                valid_for: nil,
                note: 'nothing unusual',
                currency: Currency.find_by(full_name: variables[:usa_dollar]),
                type_of_exchange: TypeOfExchange.find_by(name: variables[:type_of_exchange1]),
                type_of_contract: TypeOfContract.find_by(name: variables[:type_of_contract3]),
                type_of_payment: TypeOfPayment.find_by(name: variables[:type_of_payment1]),
                provider: Organization.where(is_provider: true).take,
                customer: Organization.where(is_buyer: true).take)

# creating warehouses
Warehouse.create([{ address: 'Красноармейская 7а', organization: Organization.find_by(short_name: '«Молочный мир»') },
                  { address: 'Неманская 17, 32', organization: Organization.find_by(short_name: '«Златка»') }])

# creating invoices
Invoice.create(
  is_closed: false,
  is_conducted: true,
  series_and_number: '124356342',
  date_and_time: nil,
  selling_on_commission: false,
  strings_count: 300,
  total_count: 250,
  summa: 340.0,
  summa_nds: 30,
  summa_with_nds: 340.0 + 30,
  record_summa: 400,
  retail_summa: 350,
  pre_assessment_summa: 300,
  write_down_summa: 50,
  note: 'nothing unusual',
  invoice_type: InvoiceType.find_by(name: variables[:invoice_type1]),
  operation: Operation.find_by(name: variables[:operation1]),
  currency: Currency.find_by(full_name: variables[:usa_dollar]),
  contract: Contract.find_by(series_and_number: '123456789'),
  agreement: Agreement.find_by(name: variables[:agreement1]),
  status_of_price_tag_printing: StatusOfPriceTagPrinting.find_by(name: variables[:status_of_price_tag_printing1]),
  status_of_acceptance: StatusOfAcceptance.find_by(name: variables[:status_of_acceptance1]),
  status_of_booting_in_equipment: StatusOfBootingInEquipment.find_by(name: variables[:status_of_booting_in_equipment1])
)

# creating acts of discrepancies
ActOfDiscrepancy.create(
  is_closed: false,
  is_conducted: true,
  series_and_number: '123436342',
  date_and_time: nil,
  strings_count: 300,
  total_count: 250,
  summa_nds: 30,
  summa_with_nds: 340.0 + 30,
  note: 'nothing unusual',
  invoice_type: InvoiceType.find_by(name: variables[:invoice_type1]),
  operation: Operation.find_by(name: variables[:operation1]),
  currency: Currency.find_by(full_name: variables[:usa_dollar]),
  invoice: Invoice.find_by(series_and_number: '124356342'),
  provider_warehouse: Warehouse.find_by(organization: Organization.find_by(short_name: '«Молочный мир»')),
  customer_warehouse: Warehouse.find_by(organization: Organization.find_by(short_name: '«Златка»'))
)

# creating invoice products
InvoiceProduct.create(
  full_name: 'Обезжиренное молоко Савушкин продукт 0.5%',
  short_name: 'молоко Савушкин продукт',
  code: '234654234',
  count: 140,
  price: 3.20,
  rate_vat: RateVat.find_by(rate: 10),
  summa_nds: 0.75,
  cost: 3.95,
  unit: f_liters,
  p_subgroup: PSubgroup.find_by(name: 'молочные товары'),
  invoice: Invoice.find_by(series_and_number: '124356342')
)

# creating act of discrepancies products
ActOfDiscrepanciesProduct.create(
  code: '353678334',
  invoice_product: InvoiceProduct.find_by(code: '234654234'),
  act_of_discrepancy: ActOfDiscrepancy.find_by(series_and_number: '123436342'),
  count: 10,
  cost: 10 * 3.20
)
