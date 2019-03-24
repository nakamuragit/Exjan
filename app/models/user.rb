class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #これ下の一文消していいかわからん
  has_one_attached :avatar
  #ここからは必要なやつ
  has_many :orders
  has_many :projects, through: :orders

  
end
