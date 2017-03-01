require 'rails_helper'

RSpec.feature 'Test the content of a meta-tag' do
  before do
    @petition = Petition.create(title: 'Titulo para que salven a las focas',
    # rubocop:disable LineLength
    text: 'El siguiente es el link para que puedas monitorear el avance de tu petición y bajar la lista de firmantes. No compartas este link con nadie',

    creator_name: 'Hilda Caballero',
    creator_email: 'hildacaballeto@seeds.net',
    image_preview: 1,
    published_at: Time.now.utc)
  end

  scenario 'Find the correct meta-tags' do
    visit '/'
    expect(page).to have_content(@petition.title)
    click_link(@petition.title)
    puts page.body
    page.find("meta[name='description']", visible: false)
    expect(page).to have_css "meta[property='og:title'][content='#{@petition.title}']", visible: false
    expect(page).to have_css "meta[property='og:description'][content='#{@petition.text}']", visible: false
    expect(page).to have_css "meta[property='og:image'][content='/assets/images/imagen_#{@petition.image_preview}.jpg']", visible: false
    # rubocop:enable LineLength
  end
end
