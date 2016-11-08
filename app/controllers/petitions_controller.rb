class PetitionsController < ApplicationController
  before_action :set_petition, only: [:edit, :update, :destroy]
  # GET /petitions
  def index
    @petitions = Petition.all
  end

  # GET /petitions/1
  # GET /petitions/public/:public_fragment
  # GET /petitions/private/:private_fragment
  def show
    page = 'show'

    if request.path.match(/\/public\//)
      @petition = Petition.find_by public_fragment: params[:public_fragment]
    elsif request.path.match(/\/private\//)
      @petition = Petition.find_by private_fragment: params[:private_fragment]
      page = 'private'
    else
      set_petition
    end

    render page
  end

  # GET /petitions/new
  def new
    @petition = Petition.new
  end

  # GET /petitions/1/edit
  def edit
  end

  # POST /petitions
  def create
    @petition = Petition.new(petition_params)

    if @petition.save
      redirect_to @petition, notice: 'Petition was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /petitions/1
  def update
    if @petition.update(petition_params)
      redirect_to @petition, notice: 'Petition was successfully updated.'
    else
      render :edit
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
      @petition = Petition.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def petition_params
      params.require(:petition).permit(:title, :text, :creator_name, :creator_email)
    end
end
