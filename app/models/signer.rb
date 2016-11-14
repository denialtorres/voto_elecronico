class Signer < ApplicationRecord
  belongs_to :petition

  validates :petition_id,
            :name,
            :last_name,
            :second_name,
            :tax_id,
            :ce,
            :ocr,
            :ne,
            presence: true,
            on: :create

  validates :tax_id, rfc: true, uniqueness: {
    scope: :petition_id,
    case_sensitive: false
  }
  validates :signature, presence: :true, on: :sign
  validates :email, email: true, allow_blank: true
end
