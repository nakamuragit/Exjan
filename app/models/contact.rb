class Contact < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :business, presence: true
  validates :reason, presence: true
end
