class Project < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :repository_link, presence: true
end