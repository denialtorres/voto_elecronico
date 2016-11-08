require 'rails_helper'

RSpec.describe "petitions/new", type: :view do
  before(:each) do
    assign(:petition, Petition.new(
      :name => "MyString",
      :text => "MyText",
      :creator_name => "MyString",
      :creator_email => "MyString",
      :private_fragment => "MyString",
      :public_fragment => "MyString",
      :callback_hash => "MyString"
    ))
  end

  it "renders new petition form" do
    render

    assert_select "form[action=?][method=?]", petitions_path, "post" do

      assert_select "input#petition_name[name=?]", "petition[name]"

      assert_select "textarea#petition_text[name=?]", "petition[text]"

      assert_select "input#petition_creator_name[name=?]", "petition[creator_name]"

      assert_select "input#petition_creator_email[name=?]", "petition[creator_email]"

      assert_select "input#petition_private_fragment[name=?]", "petition[private_fragment]"

      assert_select "input#petition_public_fragment[name=?]", "petition[public_fragment]"

      assert_select "input#petition_callback_hash[name=?]", "petition[callback_hash]"
    end
  end
end
