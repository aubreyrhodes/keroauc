class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :recurrence
  scope :incomplete, -> { where(complete: false) }
end
