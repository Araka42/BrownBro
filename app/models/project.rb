class Project < ApplicationRecord
  belongs_to :user
  has_many :jointures
  has_and_belongs_to_many :categories
end
