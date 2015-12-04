class Guest < ActiveRecord::Base


  before_create :generate_barcode


  def generate_barcode
    jazz = true
    while jazz do
      new_barcode    = SecureRandom.random_number(100000000000) 
      existing       = Guest.find_by barcode: new_barcode

      puts existing.present?
      next if existing.present?

      self.barcode = new_barcode
      jazz = false
    end
  end


  def as_json(options)
    {
      id: self.id,
      name: self.name,
      scheduled_at: self.scheduled.strftime('%dd'),
      checked_at: self.checked_at,
      group: self.group,
      barcode: self.barcode


    }.merge(options)
  end
end
