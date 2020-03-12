require 'rails_helper'

RSpec.describe User, type: :system do
  describe 'ログイン前' do
    it 'unique_idが英数字のみのユーザーを登録する' do
      visit new_user_registration_path

      fill_in 'user[name]', with: 'テスト太郎'
      fill_in 'user[unique_id]', with: 'testid'
      fill_in 'user[email]', with: 'test@gmail.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      click_button '作成'  
      expect(page).to have_content 'アカウント登録が完了しました'
    end

    it 'unique_idに「@」を含むユーザーは登録できない' do
      visit new_user_registration_path

      fill_in 'user[name]', with: 'テスト太郎'
      fill_in 'user[unique_id]', with: '@testid'
      fill_in 'user[email]', with: 'test@gmail.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      click_button '作成'  
      expect(page).to have_content 'IDは不正な値です'
    end

    it 'unique_idに「_(アンダースコア)」を含むユーザーを登録する' do
      visit new_user_registration_path
      # user = FactoryBot.create(:user, unique_id: "uni")
      fill_in 'user[name]', with: 'テスト太郎'
      fill_in 'user[unique_id]', with: 'test_id'
      fill_in 'user[email]', with: 'test@gmail.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      click_button '作成'  
      expect(page).to have_content 'アカウント登録が完了しました'
    end

    it 'ユーザー1はログインする' do
      user1 = FactoryBot.create(:user)
      visit new_user_session_path  
      fill_in 'user[email]', with: user1.email
      fill_in 'user[password]', with: user1.password
      click_button 'ログイン'  
      expect(page).to have_content 'ログインしました'
    end 
  end

  describe 'ログイン後' do
    before do
      @user1 = FactoryBot.create(:user)
      visit new_user_session_path  
      fill_in 'user[email]', with: @user1.email
      fill_in 'user[password]', with: @user1.password
      click_button 'ログイン'
    end

    it 'ユーザー1はプロフィールを変更する' do
      find(".fa-user-circle").click
      expect(page).to have_content 'プロフィールを編集'
      click_on 'プロフィールを編集'  
      expect(page).to have_content 'ユーザー名'
      expect(page).to have_content '性別'
      click_button '保存'  
      expect(page).to have_content 'プロフィールを編集'
    end

    it 'ユーザー1はログアウトする' do
      click_on 'ログアウト'
      expect(page).to have_content 'アカウント作成'
    end

    # TODO:ユーザーを削除すると、そのユーザーの投稿が全て削除されること
    
  end
end