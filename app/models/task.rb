class Task < ApplicationRecord
  validates :action, presence: true
  validates :description, presence: true
end
