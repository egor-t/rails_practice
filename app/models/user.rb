# frozen_string_literal: true

# User model
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable
  has_many :tickets
  validates :first_name, :last_name, presence: true
end
