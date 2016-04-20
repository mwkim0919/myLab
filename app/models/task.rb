class Task < ActiveRecord::Base
   belongs_to :user
   default_scope -> { order(created_at: :desc) }
   validates :user_id, presence: true
   validates :title, presence: true, length: { maximum: 140 }

   def self.search(search)
		where("title LIKE ?", "%#{search}%") ||
		where("description LIKE ?", "%#{search}%") ||
		where("start > ?", "%#{Date.parse(search[:start])}%") ||
		where("finish > ?", "%#{Date.parse(search[:finish])}%")
   end
end
