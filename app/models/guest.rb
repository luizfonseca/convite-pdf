class Guest < ActiveRecord::Base


  before_create :generate_barcode


  def generate_barcode
    self.barcode = SecureRandom.random_number(100000000000) 
  end
end
