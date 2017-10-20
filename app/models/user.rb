class User < ApplicationRecord
  has_many :messages

  validates :nickname, presence: true
end
