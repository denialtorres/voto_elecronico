class ServicesController < ApplicationController
  skip_before_action :verify_authenticity_token

  # POST external/mifiel/
  def mifiel_callback
    head :ok
  end

end
