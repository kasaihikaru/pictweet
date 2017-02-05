require 'rails_helper'
describe User do
  describe '#create' do

    it "is valid with a nickname, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
     user = build(:user, nickname: nil)
     user.valid?
     expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without an email" do
     user = build(:user, email: nil)
     user.valid?
     expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
     user = build(:user, password: nil)
     user.valid?
     expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a password_confirmation although with a password" do
     user = build(:user, password_confirmation: "")
     user.valid?
     expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is invalid with a nickname which has 7 charactors" do
      user = build(:user, nickname: "7777777")
      user.invalid?
      expect(user.errors[:nickname][0]).to include("is too long (maximum is 6 characters)")
    end

   it "is invalid with a nickname which has 7 charactors" do
      user = build(:user, nickname: "7777777")
      user.invalid?
      expect(user.errors[:nickname][0]).to include("is too long")
    end

    it "is valid with a nickname which has 6 charactors" do
      user = build(:user, nickname: "666666")
      expect(user).to be_valid
    end

    it "is invalid with a duplicate email address" do
      #はじめにユーザーを登録
      user = create(:user)
      #先に登録したユーザーと同じemailの値を持つユーザーのインスタンスを作成
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "is valid with a password which has 6 charactors " do
      user = create(:user)
      user = build(:user, email:"pass@check", password:"666666", password_confirmation:"666666")
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid with a password which has 5 charactors " do
      user = create(:user)
      user = build(:user, password:"55555", password_confirmation:"55555")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short (minimum is 6 characters)")
    end

  end
end