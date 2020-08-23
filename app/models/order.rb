class Order < ApplicationRecord
  belongs_to :campaign
  has_many :items
end
