require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録'
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、ruby_last_nameとruby_first_name、birthdayが存在すれば登録できる" do
        expect(@user).to be_vaild
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "0p9o8i"
        @user.password_confirmation = "0p9o8i"
        expect(@user).to be_vaild
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
      end
      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
      end
      it "emailに＠がないと登録できない"
        @user.email = "hialfkeod"
        @user.valid?
      it "重複したemailが存在する場合登録できない" do
        @user.save
        anuther_user = FactoryBot.build(:user, email: @user.email)
        anuther_user.valid?
      end
      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "0p9o8"
        @user.password_confirmation = "0p9o8"
        @user.valid?
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = nil
        @user.valid?
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = nil
        @user.valid?
      end
      it "ruby_last_nameが空だと登録できない" do
        @user.ruby_last_name = nil
        @user.valid?
      end
      it "ruby_first_nameが空だと登録できない" do
        @user.ruby_first_name = nil
        @user.valid?
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = nil
        @user.valid?
      end
    end
  end
end


