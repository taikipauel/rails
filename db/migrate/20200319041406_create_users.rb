class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps #created_at, updated_atの二つのマジックカラムを作成する
    end
  end
end
