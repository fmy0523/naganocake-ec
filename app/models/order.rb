class Order < ApplicationRecord

  belongs_to :customer
  has_many :ordered_items, dependent: :destroy



  enum pay:{
    credit_card: 0,
    bank_transfer: 1
  }
end
