class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  scope :last_week, -> { where("created_at >= :date", :date => 1.week.ago) } 
end
