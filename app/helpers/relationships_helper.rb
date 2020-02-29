module RelationshipsHelper
  # フォロワー数を取得する
  def follower_count(user_id)
    return Relationship.where(follow_id: user_id).count
  end
end