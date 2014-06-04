class Comment < ActiveRecord::Base
  acts_as_paranoid

  has_many :likes, as: :likable
  belongs_to :idea, counter_cache: true
  belongs_to :user

  validates :body, length: { maximum: 1000 }, presence: true

  def created_by?(user)
    return false unless user
    user_id == user.id
  end
end
