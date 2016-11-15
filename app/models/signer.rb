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

  validates :tax_id, rfc: true
  validate :unique_tax_id
  validates :signature, presence: :true, on: :sign
  validates :email, email: true, allow_blank: true

  private

    def unique_tax_id
      return true unless Signer.where(
        tax_id: tax_id,
        petition: petition
      ).where.not(signed_at: nil).count > 0
      errors.add(:tax_id, 'Ya ha firmado la petición')
    end
end
