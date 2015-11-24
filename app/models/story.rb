class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :story_group

  validates :title, presence: true
  validates :body, presence: true
  validates :user_id, presence: true
end
