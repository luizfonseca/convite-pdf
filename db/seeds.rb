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
#test = CSV.read(Rails.root.join('db/guests/lista_test.csv'), encoding: 'ISO8859-1')


#test.each do |guest|

  #if guest[0].blank?
    #next
  #end

  #Guest.where(name: guest[0].strip, group: "test", email: guest[1].strip, scheduled_at: DateTime.strptime(guest[2], '%d/%m/%y')).first_or_create
  
#end




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




## Lista do dia 30/11 
### TODO: comentar o codigo até a proxima lista!
#lista2 = CSV.read(Rails.root.join('db/guests/lista2_3011.csv'), encoding: 'ISO8859-1')


#lista2.each do |guest|

  #if guest[0].blank?
    #next
  #end

  #g = Guest.where(name: guest[0].strip, email: guest[1].strip, scheduled_at: DateTime.strptime(guest[2], '%d/%m/%y')).first_or_create
  #puts g.barcode
#end



## Lista do dia 04/12 
## TODO: comentar o codigo até a proxima lista!
#lista3 = CSV.read(Rails.root.join('db/guests/lista3_0412.csv'), encoding: 'ISO8859-1')


#lista3.each do |guest|

  #if guest[0].blank?
    #next
  #end

  #g = Guest.where(name: guest[0].strip, email: guest[1].strip, scheduled_at: DateTime.strptime(guest[2], '%d/%m/%y')).first_or_create
  #puts g.barcode
#end



# Lista UPDATE do dia 04/12 
## TODO: comentar o codigo até a proxima lista!
#lista3 = CSV.read(Rails.root.join('db/guests/lista_update_0412.csv'), encoding: 'ISO8859-1')


#lista3.each do |guest|

  #if guest[0].blank?
    #next
  #end

  #g = Guest.find_by(email: guest[1].strip)
  #if g.present?
    #g.update_attribute(:scheduled_at, DateTime.strptime(guest[2], '%d/%m/%y'))
    #puts g.barcode
  #else
    #puts "ERROR: #{guest[1]}"
  #end

#end



# Group updates
#grupo = CSV.read(Rails.root.join('db/guests/grupos.csv'))


#grupo.each do |guest|

#  if guest[2].blank?
#    next
#  end
#
#  g = Guest.find_by(email: guest[2].strip)
#  if g.present?
#    g.update_attribute(:group, guest[1])
#    puts g.group
#  else
#    puts "ERROR: #{guest[2]}"
#  end
#
#end



grupo = CSV.read(Rails.root.join('db/guests/lista_update_1012.csv'))


grupo.each do |guest|

  if guest[1].blank?
    next
  end
#
  g = Guest.where(email: guest[1].strip).first_or_initialize
  
    g.name = guest[0]
    g.checked_at = DateTime.strptime(guest[3], '%m/%d/%y %H:%M')
    g.group = guest[2]
    g.scheduled_at = DateTime.parse('2015-12-09')
    g.save!
    puts g

    puts "EXISTING: #{guest[1]}"
 
#
end



