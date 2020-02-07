# require 'rails_helper'

# describe '投稿管理', type: :system do
#     describe '投稿一覧表示機能' do
#         before do
#             # ユーザーAを作成
#             user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'test@example.com' )
#             # 作成者がユーザーAである投稿を作成
#             FactoryBot.create(:post, name: '最初の投稿', user: user_a)
#         end
#     end

#     context 'ユーザーAがログインしているとき' do
#         before do
#             # ユーザーAでログインする
#             visit login_path
#             fill_in 'メールまたはユーザーID', with: 'test@example.com'
#             fill_in 'パスワード', with: 'password'
#             click_button 'ログイン'
#         end

#         it 'ユーザーAが作成した投稿が表示される' do
#             expect(page).to have_content '最初の投稿'
#         end
#     end
# end