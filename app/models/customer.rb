class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # dependent: :destroyは、has_manyで使えるオプション。customerが削除されたらcart_item削除。
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
end
