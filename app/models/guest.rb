class Guest < ActiveRecord::Base


  before_create :generate_barcode


  def generate_barcode
    self.barcode = (Time.now.to_i / 2) * rand(99)
  end
end
