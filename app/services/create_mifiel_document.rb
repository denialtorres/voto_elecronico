class CreateMifielDocument
  attr_reader :petition,
              :errors

  def initialize(petition)
    @petition = petition
  end

  def perform
    document
  rescue RestClient::UnprocessableEntity => e
    Rails.logger.error(e)
    @errors = JSON.parse(e.response)['errors']
    false
  end

  def document
    @document ||= Mifiel::Document.create(
      file: file_path,
      signatories: [],
      callback_url: callback_url,
      allow_infinite_signers: true
    )
  end

  private

    def file_path
      path = "./tmp/#{petition.encode_title}.txt"
      File.open(path, 'w') { |f| f.write(petition.text) }
      path
    end

    def callback_url
      Rails.application.routes.url_helpers.petition_callback_url(
        host: ENV['HOST'],
        token: petition.callback_token
      )
    end
end
