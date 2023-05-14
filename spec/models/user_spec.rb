require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do

      it 'すべての入力事項が存在すれば登録できる' do
        expect(@user).to be_valid
      end

    end

    context '新規登録できない場合' do

      it 'nameが空では登録できない' do
        @user.name = ''  # nameの値を空にする
        @user.valid? # 実行
        expect(@user.errors.full_messages).to include "Name can't be blank"
      end    

      it 'nameが20文字以上は登録できない' do
        @user.name = 'アイウエオアイウエオアイウエオアイウエオア' 
        @user.valid?
        expect(@user.errors.full_messages).to include "Name is invalid"
      end    

      it 'emailが空では登録できない' do
        @user.email = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end    

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it '重複したメールアドレスは登録出来ない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end    
      
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = '1aあ1aあ'
        @user.password_confirmation = '1aあ1aあ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end

      it 'profireが空では登録できない' do
        @user.profire = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "Profire can't be blank"
      end
    end
  end
end
