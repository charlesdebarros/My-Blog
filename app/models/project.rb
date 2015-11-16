# Project model
class Project < ActiveRecord::Base
  validates :title, :link, :description, presence: true

  extend FriendlyId
  friendly_id :title, use: :slugged
end
