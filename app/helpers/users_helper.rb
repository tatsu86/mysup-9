module UsersHelper
  def calcAge(birthday)
    if birthday !~ /^\d{4}-\d{1,2}-\d{1,2}$/
      return -1
    end
    return (Time.zone.today.strftime("%Y%m%d").to_i - birthday.gsub!("-","").to_i) / 10000
  end

  # 特定ユーザーの投稿数を取得する
  def user_posts_count(user_id)
    return Post.where(user_id: user_id).count
  end
end
