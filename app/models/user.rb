class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,:validatable
  has_many :books, dependent: :destroy #has_manyの後には、1:Nの関係になるモデル名を複数形で記述。
																			#user情報と、そのuserの投稿をまとめて削除する
	attachment :profile_image # refileを使って、画像投稿ができる。記述ルール。"_id"は省略。
	validates :name, presence: true, length: {minimum: 2, maximum: 20 }, uniqueness: true
	validates :introduction, length: {maximum: 50}
# def books
#   return Book.where(user_id: self.id)
# end
end
