class Comment < ActiveRecord::Base
  belongs_to :idea

  validates :body, length: { maximum: 1000 }, presence: true
end
