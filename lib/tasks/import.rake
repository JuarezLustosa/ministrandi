require 'csv'
require 'roo'
require 'extend_string'

namespace :import do
  desc 'Import postal code'
  task :postal_code => :environment do
    PostalCode.transaction do
      CSV.foreach("#{Rails.root}/lib/import/postal_code.csv", :col_sep => ',') do |city, neighborhood, street_type, street, cep|
        city = city.strip if city
        neighborhood = neighborhood.strip if neighborhood
        street = street.strip if street
        cep = cep.strip if cep
        street_type = street_type.strip if street_type
        state_minas = 0
        
        PostalCode.create(
          :city => city,
          :neighborhood => neighborhood,
          :street_type => find_street_type(street_type),
          :street => street,
          :cep => cep,
          :state => state_minas)
      end
    end
  end  
  
  desc 'Import clients'
  task :clients => :environment do
    Client.transaction do
      spreadsheet = Roo::Excel.new("#{Rails.root}/lib/import/clientes.xls")
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        create_client(row)
      end      
    end
  end 
  
  desc 'Remove clients accents'
  task :remove_accents_clients => :environment do
    Client.transaction do
      Client.all.each do |client|
        name = client.name.removeaccents.upcase.strip if client.name.present?
        fantasy_name = client.fantasy_name.removeaccents.upcase.strip if client.fantasy_name.present?
        contact = client.contact.removeaccents.upcase.strip if client.contact.present?
        client.update_attributes(name: name, fantasy_name: fantasy_name, contact: contact)
      end
    end
  end  
  
  desc 'Remove address accents'
  task :remove_accents_address => :environment do
    Address.transaction do
      Address.all.each do |address|
        street = address.street.removeaccents.upcase.strip if address.street.present?
        neighborhood = address.neighborhood.removeaccents.upcase.strip if address.neighborhood.present?
        address.update_attributes(street: street, neighborhood: neighborhood)
      end
    end
  end
  
  desc 'Correction City '
  task :correction_city => :environment do
    Client.transaction do
      spreadsheet = Roo::Excel.new("#{Rails.root}/lib/import/clientes.xls")
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        update_client(row)
      end
    end
  end 

  desc 'Import City '
  task :city => :environment do
    City.transaction do
      CSV.foreach("#{Rails.root}/lib/import/cidades.csv", :col_sep => '|') do |x, y, name|
        City.create(:name => name)
      end
    end
  end
end

def update_client row
  name = row["Nome"].removeaccents.upcase.strip if row["Nome"].present?
  cidade = row["Município"].removeaccents.upcase.strip if row["Município"].present?
  client = Client.find_by_name(name)
  city = search_city(cidade)
  if client.present? 
    client.address.city_id = city.id if client.address.present?
    client.save if client.present?
    puts "#{client.name}"
  else
    puts "Cliente #{row["Nome"]} não encontrado"
  end
end

def create_client row
  ddd = row["DDD Com."].to_s[0..1]
  
  Client.create(
      :name => row["Nome"],
      :cnpj => row["CNPJ"],
      :fantasy_name => row["Fantasia"],
      :state_inscription => row["Ins. Estadual"],
      :contact => row["Contato"],
      :email => row["e-mail"],
      :phone1 => "#{ddd} #{row["Fone Com."]}",
      :address_attributes => {
        :cep => row["CEP"],
        :street_type => 0,
        :street => row["Logradouro"],
        :number => row["Nº"],
        :complement => row["Complemento"],
        :neighborhood => row["Bairro"],
        :city => search_city(row["Cidade"]),
        :state => 0,
      })
end

def search_city city
  City.search_by_name(city).first
end

def find_street_type(street_type)
  case street_type
  when   'RUA'        
    return 0      
  when   'ACESSO'    
    return 1
  when   'AVENIDA'   
    return 2
  when   'BECO'      
    return 3
  when   'CAMINHO'   
    return 4
  when   'CHACARA'   
    return 5
  when   'CHACARA'   
    return 6
  when   'CONJUNTO'  
    return 7
  when   'CORREDOR'  
    return 8
  when   'CORREGO'   
    return 9
  when   'ESCADA'    
    return 10
  when   'ESCADARIA' 
    return 11
  when   'ESTRADA'   
    return 12
  when   'FAZENDA'   
    return 13
  when   'FERROVIA'  
    return 14
  when   'GALERIA'   
    return 15
  when   'LADEIRA'   
    return 16
  when   'LAGO'      
    return 17
  when   'LARGO'     
    return 18
  when   'MARGEM'    
    return 19
  when   'NUCLEO'    
    return 20
  when   'PARQUE'    
    return 21
  when   'PASSAGEM'  
    return 22
  when   'PASSARELA' 
    return 23
  when   'PATIO'     
    return 24
  when   'PONTE'     
    return 25
  when   'PRACA'     
    return 26
  when   'RODOVIA'   
    return 27
  when   'TERMINAL'  
    return 28 
  when   'TRAVESSA'  
    return 29
  when   'TREVO'     
    return 30
  when   'VEREDA'    
    return 31
  when   'VIA'       
    return 32
  when   'VIELA'     
    return 33
  when   'VILA'      
    return 34

  end  
end