require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、name、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6~12文字の半角英数混合であれば登録できる" do
        @user.password = "00000q"
        @user.password_confirmation = "00000q"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "パスワードが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードは、半角6~12文字半角英数字それぞれ１文字以上含まないと登録できない" do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password  Include both letters and numbers")
      end
      it "パスワードとパスワード（確認用）、値の一致がしていないと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "ユーザー本名は、名字と名前がそれぞれ空では登録できない" do
        @user.last_name = ""
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "First name can't be blank")
      end
      it "ユーザー本名のフリガナは、名字と名前でそれぞれ空では登録できない" do
        @user.last_name_furigana = ""
        @user.first_name_furigana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name furigana はカタカナで入力して下さい。","First name furigana はカタカナで入力して下さい。")
      end
      it "生年月日が空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end




