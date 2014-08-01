class Idea < ActiveRecord::Base
  acts_as_paranoid

  has_many :likes, as: :likable
  has_many :comments
  belongs_to :user

  validates :title, length: { maximum: 100 }, presence: true

  after_save :notify_to_idobata, unless: proc { Rails.env.test? }

  def created_by?(user)
    return false unless user
    user_id == user.id
  end

  def notify_to_idobata
    message = if user
                "@#{user.nickname} created idea!: #{title}"
              else
                "Someone created idea!: #{title}"
              end
    Net::HTTP.post_form(URI.parse(Settings.idobata_uri), source: message)
  rescue => error
    logger.error [error, *error.backtrace].join("\n")
  end
end
