require 'spec_helper'

RSpec.describe User, type: :model do
  let(:valid_attributes) {
    {
      first_name: "Jason",
      last_name: "Seifer",
      email: "jason@teamtreehouse.com"
    }
  }

  context 'validation' do
    let(:user) { User.new(valid_attributes) }

    before do
      User.create(valid_attributes)
    end

    it "requires an email" do
      expect(user).to validate_presence_of(:email)
    end

    it "requires a unique email" do
      expect(user).to validate_uniqueness_of(:email)
    end

    it "require a unique email (case insensitive)" do
      user.email = "JASON@TEAMTREEHOUSE.COM"
      expect(user).to validate_uniqueness_of(:email)
    end

  end

  describe "#downcase_email" do
    it "makes the email attribute lower case" do
      user = User.new(valid_attributes.merge(email: "JASON@TEAMTREEHOUSE.COM"))
      expect{ user.downcase_email }.to change{ user.email }.
        from("JASON@TEAMTREEHOUSE.COM").
        to("jason@teamtreehouse.com")
    end

    it "downcases an email beofre saving" do
      user = User.new(valid_attributes)
      user.email = "MIKE@TEAMTREEHOUSE.COM"
      expect(user.save).to be_truthy
      expect(user.email).to eq("mike@teamtreehouse.com")
    end

  end


end
