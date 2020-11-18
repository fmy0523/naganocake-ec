class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # dependent: :destroyは、has_manyで使えるオプション。customerが削除されたらcart_item削除。
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  # enum is_deleted:{
  #   有効: 0,
  #   退会済み: 1
  # }

# 退会
  # def active_for_authentication?
  #   super && (self.is_deleted === false)
  # end

  def name
    [last_name, first_name].join(' ')
  end

  def name_kana
    [last_name_kana, first_name_kana].join(' ')
  end

end