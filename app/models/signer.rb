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
      ).where.not(signed_at: nil).count.positive?
      errors.add(:tax_id, 'Ya ha firmado la petición')
    end

  class << self
    def to_csv
      attributes_headers = %w(NOMBRE PRIMER_APELLIDO SEGUNDO_APELLIDO CORREO RFC CE OCR
                              NE SIGNATURE SIGNED_AT TWITTER)
      attributes_colums = %w(name last_name second_name email tax_id ce ocr ne signature
                             signed_at tiwtter)
      CSV.generate(headers: true) do |csv|
        csv << attributes_headers
        all.find_each do |signer|
          csv << attributes_colums.map { |attr| signer.send(attr) }
        end
      end
    end
  end
end
