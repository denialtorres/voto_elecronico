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
     meta_tag(@petition)
    render page
  end

  # GET /petitions/new
  def new
    @petition = Petition.new
  end

  # GET /petitions/private/show_signers
  def show_signers
    respond_to do |format|
      format.html
      format.csv do
        send_data @petition.signers.to_csv,
                  filename: "peticion-#{@petition.title}.csv"
      end
    end
  end

  # GET /petitions/1/edit
  def edit
    @url = { id: @petition.private_fragment }
  end

  # POST /petitions
  def create
    @petition = Petition.new(petition_params)
    @petition.image_preview.blank?
     @petition.image_preview = 1

    if @petition.save
      # PetitionMailer.petition_successfully_created(@petition.id).deliver_now
      redirect_to private_petition_path(@petition.private_fragment),
                  notice: 'Petition was successfully created.'
    else
      render :new, alert: @petition.errors.full_messages
    end
  end

  def publish
    if @petition.publish
      redirect_to private_petition_path(@petition.private_fragment),
                  notice: 'Petición publicada'
    else
      redirect_to private_petition_path(@petition.private_fragment),
                  alert: @petition.errors.full_messages.join(', ')
    end
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
      params.require(:petition).permit(:title, :text, :creator_name, :creator_email,
                                       :image_preview)
    end

    # generate the meta tags for an individual petition
    def meta_tag(petition)
      set_meta_tags title: petition.title,
                site: 'Voto Electronico',
                reverse: true,
                description: petition.text,
                twitter: {
                  card: 'summary',
                  site: '@voto_electronico',
                  title: petition.title,
                  description:  petition.text,
                  image: "/assets/images/imagen_#{petition.image_preview}.jpg"
                },
                og: {
                  title:    petition.title,
                  description: petition.text,
                  type:     'website',
                  image:    "/assets/images/imagen_#{petition.image_preview}.jpg"
                }
    end
end
