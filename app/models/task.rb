class Task < ActiveRecord::Base
   belongs_to :user
   default_scope -> { order(created_at: :desc) }
   validates :user_id, presence: true
   validates :title, presence: true, length: { maximum: 140 }

   def self.search(title)
		where("title LIKE ?", "%#{title}%") ||
      where("description LIKE ?", "%#{title}%")
   end

end
