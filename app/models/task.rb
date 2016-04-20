class Task < ActiveRecord::Base
   belongs_to :user
   default_scope -> { order(created_at: :desc) }
   validates :user_id, presence: true
   validates :title, presence: true, length: { maximum: 140 }

   def self.search(title, start, finish)
		# where("title LIKE ?", "%#{title}%")
      # where("description LIKE ?", "%#{title}%")
		# where("start = ?", start)
		# where("finish = ?", finish)
      where("title LIKE ? OR description LIKE ? OR start = ? OR finish = ?", "%#{title}%", "%#{title}%", start, finish)
   end

end
