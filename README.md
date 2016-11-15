# TransparenciaAlagoas

This gem aims to facilitating access to the "Portal da Transparência (http://transparencia.al.gov.br)" of the state of Alagoas. It abstracts the access to this portal data that is provided through a REST API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'transparencia_alagoas'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install transparencia_alagoas

## Usage

This Gem are not covering the whole API yet. For while we provide the resources of servants, biddings and patrimony. There a class responsible for each one of this resources.

Take a look at some examples:

```ruby
# encoding: utf-8

require 'transparencia_alagoas'

# Get active servant that received some money on month 8 of year 2016
# If month and/or year are not provided we'll use the current month and/or year
active_servants = TransparenciaAlagoas::Servant.active_servants(month:8, year:2016)
puts active_servants
```

We can pass any of the options available in the REST API, for example:

```ruby
# encoding: utf-8

require 'transparencia_alagoas'

# We can get a list of materials from state patrimony filtered by material name
materials = TransparenciaAlagoas::Patrimony.material_detail(ug_code: 250505, material: "WINDOWS 7 OEM STARTER 32 B MICROSOFT")
puts materials
```

Is also possible to access data from Biddings:

```ruby
# encoding: utf-8

require 'transparencia_alagoas'

biddings = TransparenciaAlagoas::Bidding.get(qty:10, offset:10, options: {"start_date": "2016-11-01", :orgao_licitante => "ITEC"})
puts biddings
```

To have more details about Portal da Transparência API please take a look on this [documentation](http://transparencia.al.gov.br/portal/api).

## Classes and Methods Available

### Class Bidding

#### Method: get(qty: 10, offset: 0, options: {})

*Available Options:*

PARAM | TYPE | DESCRIPTION
------|------|-------------
data_realizacao_dti_ | Date | Seta a data inicial que será realizada a consulta. (dd/mm/yyyy)
data_realizacao_dtf_ | Date | Seta a data final que será realizada a consulta. (dd/mm/yyyy)
modalidade | text | Filtra pela modalidade entre os retornados na consulta.
orgao_licitante | text | Filtra pelo órgão licitante entre os retornados na consulta.
status (situação) | text | Filtra pela situação entre os retornados na consulta. Valores: Aberta / Encerrada
sort | text | Define o campo o qual será ordenada a consulta.
order | text | Define a ordem que será ordenada a consulta. Valores: asc / desc

### Class Patrimony

#### Method: property_list(qty: 10, offset: 0, options: {})

*Available Options*

PARAM | TYPE | DESCRIPTION
------|------|-------------
municipio | text | Filtra pelo nome do município entre os retornados na consulta.
denominacao | text | Filtra pelo nome do imóvel (ao que é atribuído) entre os retornados na consulta.
situacao_ocupacao | text | Filtra pela situação do imóvel entre os retornados na consulta.
sort | text | Define o campo o qual será ordenada a consulta.
order | text | Define a ordem que será ordenada a consulta. Valores: asc / desc

#### Method: ug_list(qty: 10, offset: 0, options: {})

*Available Options*

PARAM | TYPE | DESCRIPTION
------|------|-------------
descricao_ug | text | Filtra pelo nome da unidade gestora entre os retornados na consulta.
sort | text | Define o campo o qual será ordenada a consulta.
order | text | Define a ordem que será ordenada a consulta. Valores: asc / desc

#### Method: materials_list(qty: 10, offset: 0, ug_code: nil, options: {})

*Available Options*

PARAM | TYPE | DESCRIPTION
------|------|-------------
codigo_ug | integer | Define por qual unidade gestora será filtrada a consulta de materiais.
descricao_conta | text | Filtra pelo subelemento entre os retornados na consulta.
material | text | Filtra pelo nome do material entre os retornados na consulta.
sort | text | Define o campo o qual será ordenada a consulta.
order | text | Define a ordem que será ordenada a consulta. Valores: asc / desc

#### Method: material_detail(qty: 10, offset: 0, ug_code: nil, material: nil, options: {})

*Available Options*

PARAM | TYPE | DESCRIPTION
------|------|-------------
codigo_ug | integer | Define por qual unidade gestora será filtrada a consulta de materiais.
material | text | Define qual material será detalhado. (nome do material)
patrimonio | text | Filtra pelo número do patrimônio entre os retornados na consulta.
codigo_antigo | text | Filtra pelo código antigo entre os retornados na consulta.
sort | text | Define o campo o qual será ordenada a consulta.
order | text | Define a ordem que será ordenada a consulta. Valores: asc / desc


### Class Servant

#### Method: active_servants(qty: 10, offset: 0, month: nil, year: nil, options: {})

*Available Options*

PARAM | TYPE | DESCRIPTION
------|------|-------------
month | integer | Seta o mês que será realizado a consulta. (mm)
year | integer | Seta o ano que será realizado a consulta. (aaaa)
nome | text | Filtra pelo nome do servidor entre os retornados na consulta.
codigo_orgao | integer | Filtra pelo código do órgão entre os retornados na consulta.
sort | text | Define o campo o qual será ordenada a consulta.
order | text | Define a ordem que será ordenada a consulta. Valores: asc / desc

#### Method: detail_active_servant(qty: 10, offset: 0, servant_id: nil, options: {})

*Available Options*

PARAM | TYPE | DESCRIPTION
------|------|-------------
servant_id | integer | Decide por qual servidor será detalhada a consulta.
ano | integer | Filtra pelo ano entre os retornados na consulta.
sort | text | Define o campo o qual será ordenada a consulta.
order | text | Define a ordem que será ordenada a consulta. Valores: asc / desc


#### Method: inactive_servants(qty: 10, offset: 0, month: nil, year: nil, options: {})

*Available Options*

PARAM | TYPE | DESCRIPTION
------|------|-------------
month | integer | Seta o mês que será realizado a consulta. (mm)
year | integer | Seta o ano que será realizado a consulta. (aaaa)
nome | text | Filtra pelo nome do servidor entre os retornados na consulta.
vinculo | integer | Filtra pelo vínculo entre os retornados na consulta. (Valores: Aposentado / Pensionista)
sort | text | Define o campo o qual será ordenada a consulta.
order | text | Define a ordem que será ordenada a consulta. (Valores: asc / desc)

#### Method: detail_inactive_servant(qty: 10, offset: 0, servant_id: nil, options: {})

*Available Options*

PARAM | TYPE | DESCRIPTION
------|------|-------------
servant_id | integer | Define por qual servidor inativo será filtrada a consulta.
ano | integer | Filtra pelo ano entre os retornados na consulta.
sort | text | Define o campo o qual será ordenada a consulta.
order | text | Define a ordem que será ordenada a consulta. (Valores: asc / desc)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nandooliveira/transparencia_alagoas. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

