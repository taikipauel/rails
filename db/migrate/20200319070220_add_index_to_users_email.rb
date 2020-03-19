class AddIndexToUsersEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :email, unique: true  
    #usersテーブルのemailカラムにインデックスを追加するために、add_indexメソッド(Rails)を使用
  end
end
