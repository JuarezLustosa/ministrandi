require 'csv'

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
        
        PostalCode.create(
          :city => city,
          :neighborhood => neighborhood,
          :street_type => find_street_type(street_type),
          :street => street,
          :cep => cep)
      end
    end
  end
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