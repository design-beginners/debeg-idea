class Idea < ActiveRecord::Base
  has_many :comments

  validates :title, length: { maximum: 100 }, presence: true
end
