class Project < ApplicationRecord
  belongs_to :user
  has_many :jointures
  has_many :categories, through: :jointures
end
