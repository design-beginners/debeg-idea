class Comment < ActiveRecord::Base
  belongs_to :idea
  belongs_to :user

  validates :body, length: { maximum: 1000 }, presence: true
end
