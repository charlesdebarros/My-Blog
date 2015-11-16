# Project model
class Project < ActiveRecord::Base
  validates :title, :link, :description, presence: true
end
