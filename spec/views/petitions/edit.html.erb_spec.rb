# rubocop:disable Metrics/LineLength
require 'rails_helper'

RSpec.describe 'petitions/edit', type: :view do
  before(:each) do
    @petition = assign(:petition, Petition.create!(
                                    name: 'MyString',
                                    text: 'MyText',
                                    creator_name: 'MyString',
                                    creator_email: 'MyString',
                                    private_fragment: 'MyString',
                                    public_fragment: 'MyString',
                                    callback_hash: 'MyString'
    ))
  end

  it 'renders the edit petition form' do
    render

    assert_select 'form[action=?][method=?]', petition_path(@petition), 'post' do

      assert_select 'input#petition_name[name=?]', 'petition[name]'

      assert_select 'textarea#petition_text[name=?]', 'petition[text]'

      assert_select 'input#petition_creator_name[name=?]', 'petition[creator_name]'

      assert_select 'input#petition_creator_email[name=?]', 'petition[creator_email]'

      assert_select 'input#petition_private_fragment[name=?]', 'petition[private_fragment]'

      assert_select 'input#petition_public_fragment[name=?]', 'petition[public_fragment]'

      assert_select 'input#petition_callback_hash[name=?]', 'petition[callback_hash]'
    end
  end
end
