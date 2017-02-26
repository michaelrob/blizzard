class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :assigned, class_name: "User"

  validates :title, presence: true
  validates :body, presence: true
  validates :user_id, presence: true
end
