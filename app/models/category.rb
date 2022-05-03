class Category < ApplicationRecord
  belongs_to :user
  has_many :jointures
  has_many :projects, through: :jointures
  CATEGORIES = ["captations évènements", "contenus digitaux", "short media", "films institutionnels", "reportages et publireportages"]
  validates :title, inclusion: { in: CATEGORIES }
end
