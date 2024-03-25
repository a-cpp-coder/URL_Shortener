class Link < ApplicationRecord
  scope :recent_first, -> { order(created_at: :desc) }
  # can reuse this, make as a common thing

  validates :url, presence: true

  def self.find(id)
    super(ShortCode.decode(id))
  end
  def to_param
    ShortCode.encode(id)
  end
end
