class Item < ApplicationRecord
  before_create :generate_lucky
  belongs_to :order

  private

  def generate_lucky
    lucky_number = ''
    loop do
      lucky_number = SecureRandom.alphanumeric(10)
      break unless Item.where(number: lucky_number).count.positive?
    end

    self.number = lucky_number
  end
end
