require 'rails_helper'

RSpec.feature 'Download a CSV table of the signers' do
  before do
    @petition = Petition.create(title: 'Titulo para que salven a las focas',
       # rubocop:disable LineLength
       text: 'El siguiente es el link para que puedas monitorear el avance de tu petición y bajar la lista de firmantes. No compartas este link con nadie',
       # rubocop:enable LineLength
       creator_name: 'Hilda Caballero',
       creator_email: 'hildacaballeto@seeds.net',
       published_at: Time.now.utc)
  end

  scenario 'A user can download a CSV table with the signers of his petition' do
    # visit root page
    visit '/'
      expect(page).to have_content('private link')
      click_link 'private link', :match => :first
      click_link 'Ver firmantes'
      click_link 'Descargar Firmantes'
      page.response_headers['Content-Type'].should == 'text/csv'
  end
end
