class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # dependent: :destroyは、has_manyで使えるオプション。customerが削除されたらcart_item削除。
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy


  enum is_deleted:{
    退会済み: true,
    有効: false
  }

  # 退会
  # authenticationで認証
  # is_deletedカラムがfalse（有効）ならログインできる
  def active_for_authentication?
    is_deleted == '有効'
  end


  # 苗字と名前の結合
  def name
    [last_name, first_name].join(' ')
  end

  def name_kana
    [last_name_kana, first_name_kana].join(' ')
  end

end