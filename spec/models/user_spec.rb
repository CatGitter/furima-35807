require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nickname、email、password、password_confirmation、last_name、first_name、kana_last_name、kana_first_name、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できる' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'kana_last_nameが空では登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end

      it 'kana_first_nameが空では登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'passwordが5文字以下だと登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordがpassword_confirmationが不一致だと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '重複したemailが存在すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'last_nameは、全角（漢字・ひらがな・カタカナ）での入力でないと登録できない' do
        @user.last_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it 'first_nameは、全角（漢字・ひらがな・カタカナ）での入力でないと登録できない' do
        @user.first_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it 'kana_last_nameは、全角（カタカナ）での入力出ないと登録できない' do
        @user.kana_last_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name is invalid")
      end

      it 'kana_first_nameは、全角（カタカナ）での入力出ないと登録できない' do
        @user.kana_first_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name is invalid")
      end
    end
  end
end
