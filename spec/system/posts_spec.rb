require 'rails_helper'

RSpec.describe Post, type: :system do
    before do
        @user1 = FactoryBot.create(:user)
        visit root_path

        fill_in 'session[email]', with: @user1.email
        fill_in 'session[password]', with: @user1.password
        click_button 'ログイン'
    end

    it 'ユーザー1で投稿する' do
        find('.btn-add-tweet').click
        fill_in 'post[body]', with: 'このプロテインは美味しい。'
        find('#post-user', visible: false).set(@user1.id)
        click_button '投稿する'
        expect(page).to have_content '投稿しました'
    end

    it 'ユーザー1の投稿を削除する' do
        post = FactoryBot.create(:post, body: "削除テストようの投稿", user_id: @user1.id)
        visit "#{@user1.unique_id.to_s}/status/#{post.id.to_s}"

        click_on "削除"
        expect(page).to have_content "削除しました" 
    end
end