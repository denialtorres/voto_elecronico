require 'rails_helper'

RSpec.describe "petitions/show", type: :view do
  before(:each) do
    @petition = assign(:petition, Petition.create!(
      :name => "Name",
      :text => "MyText",
      :creator_name => "Creator Name",
      :creator_email => "Creator Email",
      :private_fragment => "Private Fragment",
      :public_fragment => "Public Fragment",
      :callback_hash => "Callback Hash"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Creator Name/)
    expect(rendered).to match(/Creator Email/)
    expect(rendered).to match(/Private Fragment/)
    expect(rendered).to match(/Public Fragment/)
    expect(rendered).to match(/Callback Hash/)
  end
end
