class Category < ApplicationRecord
  belongs_to :user
  has_many :jointures
  has_and_belongs_to_many :projects
end
