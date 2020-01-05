class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # TODO:「@」を除外してLIKE検索する
  def self.search_user(search)
    return all unless search
    where(['name like ? or unique_id like ?', "%#{search}%", "%#{search}%"])
  end
end
