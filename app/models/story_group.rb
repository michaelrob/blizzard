class StoryGroup < ActiveRecord::Base
  validates :title, presence: true
  has_many :stories
end
