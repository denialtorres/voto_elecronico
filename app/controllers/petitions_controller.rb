class PetitionsController < ApplicationController
  before_action :set_petition, only: [
    :edit,
    :update,
    :destroy,
    :publish,
    :close,
    :show_signers
  ]

  # GET /petitions
  def index
    @petitions = Petition.published.not_closed
  end

  # GET /petitions/1
  # GET /petitions/public/:public_fragment
  # GET /petitions/private/:private_fragment
  def show
    page = 'show'
    if request.path =~ %r{\/private\/}
      @petition = Petition.find_by(private_fragment: params[:private_fragment])
      page = 'private'
    else
      @petition = Petition.find_by(public_fragment: params[:id])
    end

    render page
  end

  # GET /petitions/new
  def new
    @petition = Petition.new
  end

  # GET /petitions/1/edit
  def edit
    @url = { id: petition.private_fragment }
  end

  # POST /petitions
  def create
    @petition = Petition.new(petition_params)
    if @petition.save
      PetitionMailer.petition_successfully_created(@petition.id).deliver_now
      redirect_to private_petition_path(@petition.private_fragment), notice: 'Petition was successfully created.'
    else
      render :new
    end
  end

  def publish
    @petition.publish

    redirect_to private_petition_path(@petition.private_fragment),
                notice: 'Petición publicada'
  end

  def close
    @petition.close

    redirect_to private_petition_path(@petition.private_fragment),
                notice: 'Petición cerrada'
  end

  def sign
    @petition = Petition.find_by(public_fragment: params[:petition_id])
  end

  # PATCH/PUT /petitions/1
  def update
    if @petition.update(petition_params)
      redirect_to private_petition_path(@petition.private_fragment),
                  notice: 'Petition was successfully updated.'
    else
      render :edit, id: @petition.private_fragment
    end
  end

  # DELETE /petitions/1
  def destroy
    @petition.destroy
    redirect_to petitions_url, notice: 'Petition was successfully destroyed.'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_petition
      @petition = Petition.find_by(
        private_fragment: (params[:id] || params[:petition_id])
      )
    end

    # Only allow a trusted parameter "white list" through.
    def petition_params
      params.require(:petition).permit(:title, :text, :creator_name, :creator_email)
    end
end
