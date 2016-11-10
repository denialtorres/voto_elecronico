class Petition < ApplicationRecord
  before_create :set_private_url_fragment
  before_create :set_public_url_fragment
  has_secure_token :callback_token

  private

    def clean_title
      I18n.transliterate(self.title).split.map { |w| w.gsub(/\W+/, '') }.join(' ')
    end

    def encode_title
      clean_title.tr(' ', '-').slice(0,49).chomp('-').downcase
    end

    def obfuscate_title
      clean_title.tr(' ', '').slice(0,50).chars.shuffle.join
    end

    def build_private_fragment
      "#{Time.now.to_i}#{obfuscate_title}"
    end

    def build_public_fragment
      "#{Time.now.to_i}-#{encode_title}"
    end

    def set_private_url_fragment
      self.private_fragment = build_private_fragment
    end

    def set_public_url_fragment
      self.public_fragment = build_public_fragment
    end

end
