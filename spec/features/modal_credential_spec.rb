require 'rails_helper'

RSpec.feature 'Show a modal with the IFE instructions when a user click on more info' do
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
      expect(page).to have_content('Firmar petición')
      click_link('Firmar petición', match: :first)
      page.should have_css('.glyphicon-question-sign')
      first('.icon-question-class').click

      within('.modal-dialog') do
        page.should have_content('Modelo A')
        page.should have_content('Modelo B')
      end
  end
end
