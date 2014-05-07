class Comment < ActiveRecord::Base
  has_many :likes, as: :likable
  belongs_to :idea
  belongs_to :user

  validates :body, length: { maximum: 1000 }, presence: true
end
