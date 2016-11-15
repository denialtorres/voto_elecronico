require 'rails_helper'

RSpec.describe 'petitions/index', type: :view do
  before(:each) do
    assign(:petitions, [
             Petition.create!(
               name: 'Name',
               text: 'MyText',
               creator_name: 'Creator Name',
               creator_email: 'Creator Email',
               private_fragment: 'Private Fragment',
               public_fragment: 'Public Fragment',
               callback_hash: 'Callback Hash'
             ),
             Petition.create!(
               name: 'Name',
               text: 'MyText',
               creator_name: 'Creator Name',
               creator_email: 'Creator Email',
               private_fragment: 'Private Fragment',
               public_fragment: 'Public Fragment',
               callback_hash: 'Callback Hash'
             )
           ])
  end

  it 'renders a list of petitions' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 'Creator Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Creator Email'.to_s, count: 2
    assert_select 'tr>td', text: 'Private Fragment'.to_s, count: 2
    assert_select 'tr>td', text: 'Public Fragment'.to_s, count: 2
    assert_select 'tr>td', text: 'Callback Hash'.to_s, count: 2
  end
end
