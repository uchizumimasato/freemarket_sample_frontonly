require 'rails_helper'
describe User do
  describe '#create' do
    it "is valid with all required columns" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid with a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid with a name" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "is invalid with a name_kana" do
      user = build(:user, name_kana: "")
      user.valid?
      expect(user.errors[:name_kana]).to include("can't be blank")
    end

    it "is invalid with a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid with a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid with a password_confirmation" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("can't be blank")
    end

    it "is invalid with a postal_code" do
      user = build(:user, postal_code: "")
      user.valid?
      expect(user.errors[:postal_code]).to include("can't be blank")
    end

    it "is invalid with a postal_code" do
      user = build(:user, prefecture: "")
      user.valid?
      expect(user.errors[:prefecture]).to include("can't be blank")
    end

    it "is invalid without a duplicate email" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "is invalid with a city" do
      user = build(:user, city: "")
      user.valid?
      expect(user.errors[:city]).to include("can't be blank")
    end

    it "is invalid with a address" do
      user = build(:user, address: "")
      user.valid?
      expect(user.errors[:address]).to include("can't be blank")
    end

    it "is invalid without a password minimum 6 count" do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      expect(user).to be_valid
    end

    it "is invalid without a password maximum 6 count" do
      user = build(:user, password: "00000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end
end
