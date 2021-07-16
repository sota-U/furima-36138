require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    context '新規登録できるとき' do
      it 'nickname、email、password、password_confirmation、last_name、first_name、last_name_reading、first_name_reading、birthdayが存在すれば登録できること' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
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

      it 'emailに一意性がない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに@が含まれていない' do
        @user.email = 'testhoge.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが６文字以上入力されていない' do
        @user.password = '44444'
        @user.password_confirmation = '44444'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが半角英数字混合で入力されていない' do
        @user.password = 'abcdefg'
        @user.password_confirmation = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Password It is invalid. Enter mixture half-width alphanumeric characters.')
      end

      it 'passwordとpassword_confirmationが一致していない' do
        @user.password = 'abcde32'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'last_nameとfirst_nameが空では登録できない' do
        @user.last_name = ''
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "First name can't be blank")
      end

      it 'last_nameとfirst_nameが全角で入力されていない' do
        @user.last_name = 'ﾀﾅｶ'
        @user.first_name = 'ﾘｭｳﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters.',
                                                      'First name is invalid. Input full-width characters.')
      end

      it 'last_name_readingとfitst_name_readingが空では登録できない' do
        @user.last_name_reading = ''
        @user.first_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading can't be blank", "First name reading can't be blank")
      end

      it 'last_name_readingとfirst_name_readingがカタカナの全角で入力されていない' do
        @user.last_name_reading = 'ﾀﾅｶ'
        @user.first_name_reading = 'ﾘｭｳﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name reading is invalid. Input full-width katakana characters.',
                                                      'First name reading is invalid. Input full-width katakana characters.')
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
