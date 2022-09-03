class Channel < ApplicationRecord
  validates :name, length: { minimum: 2 }, presence: true

  has_many :messages
end
