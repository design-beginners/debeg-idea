class Idea < ActiveRecord::Base
  acts_as_paranoid

  has_many :likes, as: :likable
  has_many :comments
  belongs_to :user

  validates :title, length: { maximum: 100 }, presence: true

  after_save :notify_to_idobata, if: Proc.new { Rails.env.production? }

  def created_by?(user)
    return false unless user
    user_id == user.id
  end

  def notify_to_idobata
    idobata_uri = URI.parse('https://idobata.io/hook/generic/ff5734c7-fb93-4085-87ae-ab58af06cb22')
    message = if user
                "@#{user.nickname} created idea!: #{title}"
              else
                "Someone created idea!: #{title}"
              end
    Net::HTTP.post_form(idobata_uri, source: message)
  rescue => e
    logger.error [e, *e.backtrace].join("\n")
  end
end
