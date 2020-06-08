class AddColumn < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :name, :string
  	add_column :users, :introduction, :text
  	add_column :users, :profile_image_id, :integer #画像保存カラムはstring or text型にしないとダメ
  	add_column :books, :title, :string
  	add_column :books, :body, :text
  	add_column :books, :user_id, :integer
  end
end
# string 文字列型
# text テキスト（不定長文字列）型
# integer 整数型
# float 浮動小数点数型
# decimal 固定長整数型
# datetime 日時型
# timestamp タイムスタンプ型
# time 時刻型
# date 日付型
# binary バイナリ文字列型
# boolean 真偽値型
# references 他のテーブルへの外部キーの定義、_id が付いた整数