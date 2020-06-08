class Book < ApplicationRecord
	belongs_to :user, optional: true #外部キーのnilを許可。must exist解決。
	#has_manyとは逆の機能。単数系。
# 	def user
#   #インスタンスメソッドないで、selfはインスタンス自身を表す
#   return User.find_by(id: self.user_id)
# end
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
