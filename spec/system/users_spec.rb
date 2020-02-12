require 'rails_helper'

RSpec.describe User, type: :system do
    describe 'ログイン前' do
        it 'ユーザー登録画面を表示する' do
            visit root_path
            click_on 'アカウント作成はこちら'
    
            expect(page).to have_content 'ユーザー登録'
        end

        it 'ユーザー1はログインする' do
            user1 = FactoryBot.create(:user)
            visit root_path
    
            fill_in 'session[email]', with: user1.email
            fill_in 'session[password]', with: user1.password
            click_button 'ログイン'
    
            expect(page).to have_content 'ログインしました'
        end 
    end

    describe 'ログイン後' do
        before do
            @user1 = FactoryBot.create(:user)
            visit root_path
    
            fill_in 'session[email]', with: @user1.email
            fill_in 'session[password]', with: @user1.password
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
            expect(page).to have_content 'アカウント作成はこちら'
        end

        # TODO:ユーザーを削除すると、そのユーザーの投稿が全て削除されること
        
    end
end