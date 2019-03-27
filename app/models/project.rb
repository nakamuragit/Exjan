class Project < ApplicationRecord
  has_many :orders
  has_many :users, through: :orders
  validates :company_name, presence: true
  validates :pay, presence: true
  validates :period, presence: true
  validates :method, presence: true
  validates :cutback, presence: true
  validates :site, presence: true
end
