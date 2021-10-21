class CreateMicroposts < ActiveRecord::Migration[6.1]
  def change
    create_join_table :microposts, :users
    add_index :microposts_users, [:micropost_id, :user_id], unique: true, name: 'index_posts_users'
  end
end
