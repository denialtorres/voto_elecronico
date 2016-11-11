class Petition < ApplicationRecord
  before_create :set_private_url_fragment
  before_create :set_public_url_fragment
  has_secure_token :callback_token

  scope :published, -> { where.not(published_at: nil) }
  scope :not_closed, -> { where(closed_at: nil) }

  def publish
    update_attribute(:published_at, Time.now.utc)
  end

  def close
    update_attribute(:closed_at, Time.now.utc)
  end

  def published?
    published_at.present?
  end

  private

    def clean_title
      I18n.transliterate(title).split.map { |w| w.gsub(/\W+/, '') }.join(' ')
    end

    def encode_title
      clean_title.tr(' ', '-').slice(0, 49).chomp('-').downcase
    end

    def set_public_url_fragment
      self.public_fragment = loop do
        break encode_title unless self.class.exists?(public_fragment: encode_title)
        "#{Time.now.to_i}-#{encode_title}"
      end
    end

    def set_private_url_fragment
      self.private_fragment = loop do
        random_token = SecureRandom.uuid
        break random_token unless self.class.exists?(private_fragment: random_token)
      end
    end
end
