class Category < ApplicationRecord
  belongs_to :user
  has_many :jointures
  CATEGORIES = ["captations évènements", "contenus digitaux", "short media", "films institutionnels", "reportages et publireportages"]
  validates :category, inclusion: { in: CATEGORIES }
  has_and_belongs_to_many :projects, through: :jointures
end
