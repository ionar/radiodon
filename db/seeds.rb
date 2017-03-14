Province.create!([
  {name: "Acre", acronym: "AC"},
  {name: "Alagoas", acronym: "AL"},
  {name: "Amapá", acronym: "AP"},
  {name: "Amazonas", acronym: "AM"},
  {name: "Bahia", acronym: "BA"},
  {name: "Ceará", acronym: "CE"},
  {name: "Distrito Federal", acronym: "DF"},
  {name: "Espírito Santo", acronym: "ES"},
  {name: "Goiás", acronym: "GO"},
  {name: "Maranhão", acronym: "MA"},
  {name: "Mato Grosso", acronym: "MT"},
  {name: "Mato Grosso do Sul", acronym: "MS"},
  {name: "Minas Gerais", acronym: "MG"},
  {name: "Pará", acronym: "PA"},
  {name: "Paraíba", acronym: "PB"},
  {name: "Paraná", acronym: "PR"},
  {name: "Pernambuco", acronym: "PE"},
  {name: "Piauí", acronym: "PI"},
  {name: "Rio de Janeiro", acronym: "RJ"},
  {name: "Rio Grande do Norte", acronym: "RN"},
  {name: "Rio Grande do Sul", acronym: "RS"},
  {name: "Rondônia", acronym: "RO"},
  {name: "Roraima", acronym: "RR"},
  {name: "Santa Catarina", acronym: "SC"},
  {name: "São Paulo", acronym: "SP"},
  {name: "Sergipe", acronym: "SE"},
  {name: "Tocantins", acronym: "TO"}
])

Clinic.create!([
  {fantasy_name: "Radiodôntica - São Miguel do Oeste", corporate_name: "MSS", cnpj: "dfdf234234", technical_manager: "5234234", address: "234234", cep: "234234", city: "234234", province_id: 20, phone: "234234"},
  {fantasy_name: "Radiodôntica - Chapecó", corporate_name: "asdfaf", cnpj: "adfadf", technical_manager: "adfadf", address: "asdfadf", cep: "sdfasdf", city: "adaf", province_id: 2, phone: "asfdaf"},
  {fantasy_name: "Radiodôntica - Itapiranga", corporate_name: "MSS ", cnpj: "656465464", technical_manager: "Dr. Vilmar Siviero", address: "Av. Beira Rio", cep: "89900-000", city: "Itapiranga", province_id: 1, phone: "6464654"},
  {fantasy_name: "Radiodôntica Cedro", corporate_name: "MSS tal", cnpj: "64684648", technical_manager: "Dr. Vilmar Siviero", address: "Rua Rio", cep: "89905-000", city: "São José do Cedro", province_id: 1, phone: "684684684"}
])
Requester.create!([
  {name: "O próprio paciente", register: "", email: "", phone: "", notes: ""},
  {name: "Dr. Vilmar Cleoci Siviero", register: "CRO 3628/SC", email: "radiodontica@radiodontica.com.br", phone: "", notes: "Requer que envie a doc para o consultório."},
])
Exam.create!([
  {name: "PAN"},
  {name: "Tomografia"},
  {name: "Documentação"}
])


Product.delete_all

Product.create!([
  {id: 1, name: "Nintendo Wii U Premium", price: 250},
  {id: 2, name: "XBox 360 250GB", price: 250},
  {id: 3, name: "Playstation 3 500 GB", price: 239.95},
  {id: 4, name: "Nintendo Wii", price: 99.95},
  {id: 5, name: "Nintendo 3DS", price: 174.95}
])