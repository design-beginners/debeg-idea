class Idea < ActiveRecord::Base
  has_many :likes, as: :likable
  has_many :comments
  belongs_to :user

  validates :title, length: { maximum: 100 }, presence: true

  def created_by?(user)
    return false unless user
    user_id == user.id
  end
end
