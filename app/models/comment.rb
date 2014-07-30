class Comment < ActiveRecord::Base
  acts_as_paranoid

  has_many :likes, as: :likable
  belongs_to :idea, counter_cache: true
  belongs_to :user

  validates :body, length: { maximum: 1000 }, presence: true

  after_save :notify_to_idobata, unless: proc { Rails.env.test? }

  def created_by?(user)
    return false unless user
    user_id == user.id
  end

  def notify_to_idobata
    message = "@#{user.nickname} created comment to #{idea.title}: #{body}"

    Net::HTTP.post_form(URI.parse(Settings.idobata_uri), source: message)
  rescue => e
    logger.error [e, *e.backtrace].join("\n")
  end
end
