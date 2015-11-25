# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

# Lista Teste
# TODO: comentar o codigo até a proxima lista!
lista2 = CSV.read(Rails.root.join('db/guests/lista_test.csv'), encoding: 'ISO8859-1')


lista2.each do |guest|

  if guest[0].blank?
    next
  end

  Guest.where(name: guest[0].strip, email: guest[1].strip, scheduled_at: DateTime.strptime(guest[2], '%d/%m/%y')).first_or_create
  
end




## Lista do dia 24/11
## TODO: comentar o codigo até a proxima lista!
#lista1 = CSV.read(Rails.root.join('db/guests/lista1_1811.csv'), encoding: 'ISO8859-1')


#lista1.each do |guest|

  #if guest[0].blank?
    #next
  #end
  
  #g = Guest.where(name: guest[0].strip, email: guest[1].strip, scheduled_at: DateTime.strptime(guest[2], '%d/%m/%y')).first_or_create
  #puts g.barcode
#end













# Lista do dia ____
# TODO: comentar o codigo até a proxima lista!
#lista2 = CSV.read(Rails.root.join('db/guests/lista2_2811.csv'), encoding: 'ISO8859-1')


#lista2.each do |guest|

  #if guest[0].blank?
    #next
  #end

  #Guest.where(name: guest[0].strip, email: guest[1].strip, scheduled_at: DateTime.strptime(guest[2], '%d/%m/%y')).first_or_create
  
#end



