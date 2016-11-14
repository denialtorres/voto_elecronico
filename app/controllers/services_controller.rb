class ServicesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :validate_petition
  before_action :validate_signer

  def mifiel_callback
    if signer.update_attributes(signer_params)
      head :ok
    else
      head :bad_request
    end
  end

  private

    def signer_params
      @signer_params ||= params.require(:signatures).permit(
        :email,
        :tax_id,
        :certificate_number,
        :signature,
        :signed_at
      )
    end

    def tax_id
      signer_params[:tax_id]
    end

    def petition
      @petition ||= Petition.find_by(callback_token: params[:token])
    end

    def signer
      @signer ||= petition.signers.find_by(tax_id: signer_params[:tax_id])
    end

    def validate_signer
      head :bad_request unless signer
    end

    def validate_petition
      head :bad_request unless petition
    end
end
