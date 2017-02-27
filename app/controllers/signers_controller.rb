class SignersController < ApplicationController
  before_action :set_petition
  before_action :merge_petition, only: :create

  def new
    @signer = Signer.new
    @url = petition_signers_path(petition_id: params[:petition_id])
  end

  def create
    @signer = Signer.new(signer_params)
    if @signer.save
      redirect_to petition_sign_path(petition_id: params[:petition_id])
    else
      @url = petition_signers_path(petition_id: params[:petition_id])
      render :new, alert: @signer.errors.full_messages
    end
  end

  private

    def merge_petition
      signer_params.merge!(petition: @petition)
    end

    def set_petition
      @petition = Petition.find_by(public_fragment: params[:petition_id])
    end

    def signer_params
      @signer_params ||= params.require(:signer).permit(
        :name,
        :email,
        :last_name,
        :second_name,
        :tax_id,
        :ce,
        :ocr,
        :ne,
        :tiwtter
      )
    end
end
