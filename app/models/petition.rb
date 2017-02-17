class Petition < ApplicationRecord
  before_create :set_private_url_fragment
  before_create :set_public_url_fragment
  has_secure_token :callback_token

  has_many :signers

  scope :published, -> { where.not(published_at: nil) }
  scope :not_closed, -> { where(closed_at: nil) }

  validates :text, length: { minimum: 60 }, presence: true
  validates :title, presence: true

  def publish
    return false unless create_mifiel_document
    update_attribute(:published_at, Time.now.utc)
  end

  # TODO: close document in mifiel.com
  def close
    update_attribute(:closed_at, Time.now.utc)
  end

  def published?
    published_at.present?
  end

  def closed?
    closed_at.present?
  end

  def encode_title
    clean_title.tr(' ', '-').slice(0, 49).chomp('-').downcase
  end


  private

    def clean_title
      I18n.transliterate(title).split.map { |w| w.gsub(/\W+/, '') }.join(' ')
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

    def create_mifiel_document
      service = CreateMifielDocument.new(self)
      doc = service.perform
      if doc && doc.widget_id
        update_attribute(:widget_id, doc.widget_id)
      else
        errors.add :base, service.errors
      end
    end
end
