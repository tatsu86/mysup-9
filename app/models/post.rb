class Post < ApplicationRecord
    def self.search(search)
        return all unless search
        where(['body like ?', "%#{search}%"])
    end
end
