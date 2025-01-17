require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー情報が登録できるとき' do
      it 'nicknameとemailとpasswordとpassword_confirmationとfirst_nameとlast_nameとkana_firstとkana_lastとbirth_idが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context 'ユーザー情報が登録できない時' do
      it 'ニックネームが必須であること' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが必須であること。' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'testgmail'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = 'asd12'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'qwerty'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '222222'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'ｋｄｇｈｘｍ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字のみで入力してください")
      end
      it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
        @user.password = '123qwe'
        @user.password_confirmation = '123qwer'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'お名前(全角)は、名字が必須であること' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'お名前(全角)は、名前が必須であること' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it '名字(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.first_name = 'ootuka'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it '名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.last_name = 'issei'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      it 'お名前カナ(全角)は、名字が必須であること' do
        @user.kana_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first can't be blank")
      end
      it 'お名前カナ(全角)は、名前が必須であること' do
        @user.kana_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last can't be blank")
      end
      it '名字カナ(全角)は、全角（カタカナ）での入力が必須であること' do
        @user.kana_first = '大塚'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first 全角(カタカナ)を使用してください")
      end
      it '名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
        @user.kana_last = '一生'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last 全角(カタカナ)を使用してください")
      end
      it '生年月日が必須であること' do
        @user.birth_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end
