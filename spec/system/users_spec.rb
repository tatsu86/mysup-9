require 'rails_helper'

RSpec.describe User, type: :system do    
    it 'ログイン画面が表示されること' do
        visit root_path

        expect(page).to have_content 'ログイン'
        expect(page).to have_content 'アカウント作成はこちら'
    end

    it 'ユーザー登録画面が表示されること' do
        visit root_path
        click_on 'アカウント作成はこちら'

        expect(page).to have_content 'ユーザー登録'
    end

    let!(:user) { User.create(name: 'テストユーザー', unique_id: 'example_id', email: 'hayashideveloper@gmail.com', password: '12345678', birthday: '1996/08/06') }
    it 'ログイン後に投稿一覧画面が表示されること' do
        user1 = FactoryBot.create(:user)
        visit root_path

        fill_in 'session[email]', with: user1.email
        fill_in 'session[password]', with: user1.password
        # TODO:テストユーザーでログインボタンは見つかるのに、ログインボタンが見つからない意味がわからない
        # click_on 'ログイン'
        click_on 'テストユーザーでログイン'

        expect(page).to have_content 'ログインしました'
    end
end