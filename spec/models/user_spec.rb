require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    it "メールアドレスが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include ("メールアドレスを入力してください")
    end

    it "メールアドレスに@がないと登録できない" do
      @user.email = "testexample"
      @user.valid?
      expect(@user.errors.full_messages).to include ("メールアドレスは不正な値です")
    end

    it "パスワードが空だと登録できない" do
      @user.password = ""
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include ("パスワードを入力してください")
    end

    it "パスワードとパスワード(確認用)が一緒じゃないと登録できない" do
      @user.password_confirmation = "tanaka123"
      @user.valid?
      expect(@user.errors.full_messages).to include ("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it "パスワードは半角英数字6文字以上じゃないと登録できない" do
      @user.password = "ab123"
      @user.password_confirmation = "ab123"
      @user.valid?
      expect(@user.errors.full_messages).to include ("パスワードは6文字以上で入力してください")
    end


  end

end
