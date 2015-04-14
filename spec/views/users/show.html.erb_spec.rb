require 'spec_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      first_name: "Jason",
      last_name: "Seifer",
      email: "jason@teamtreehouse.com",
      password: "treehouse1234",
      password_confirmation: "treehouse1234"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First name/)
    expect(rendered).to match(/Last name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Password digest/)
  end
end
