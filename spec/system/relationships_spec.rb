require 'rails_helper'

RSpec.describe Relationship, type: :system do
  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    visit root_path

    fill_in 'user[email]', with: @user1.email
    fill_in 'user[password]', with: @user1.password
    click_button 'ログイン'
  end

  it 'ユーザー1がユーザー2をフォローできること' do
    visit "/#{@user2.unique_id.to_s}"

    click_button 'フォローする'
    expect(page).to have_content 'フォローしました'
  end

  it 'ユーザー1がユーザー2のフォローを外せること' do
    visit "/#{@user2.unique_id.to_s}"

    click_button 'フォローする'
    click_button 'フォロー解除'
    expect(page).to have_content 'フォローを解除しました'
  end
end