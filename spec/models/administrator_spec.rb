require 'rails_helper'

RSpec.describe Administrator, type: :model do
  describe "#password=" do
    it "passwordに任意の文字列を与えた場合、hashed_passwordは60文字の文字列になる" do
      admin = Administrator.new
      admin.password = "foobar"

      expect(admin.hashed_password).to be_kind_of(String)
      expect(admin.hashed_password.size).to eq(60)
    end

    it "passwordにnilを与えた場合、hashed_passwordはnilになる" do
      admin = Administrator.new
      admin.password = nil

      expect(admin.hashed_password).to be_nil
    end
  end
end
