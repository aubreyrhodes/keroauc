class Task < ActiveRecord::Base
  belongs_to :user
  scope :incomplete, -> { where(complete: false) }
end
