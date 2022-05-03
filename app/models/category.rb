class Category < ApplicationRecord
  belongs_to :user
  has_many :jointures
  has_many :projects, through: :jointures
end
