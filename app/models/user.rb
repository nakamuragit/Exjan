class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #ここからは必要なやつ
  has_many :orders
  has_many :projects, through: :orders
  validates :active_site, presence: true
  validates :active_url, presence: true
  validates :channel_name, presence: true
  validates :stage_name, presence: true
end
