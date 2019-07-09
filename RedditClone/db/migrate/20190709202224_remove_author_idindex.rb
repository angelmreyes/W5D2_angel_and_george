class RemoveAuthorIdindex < ActiveRecord::Migration[5.2]
  def change
    remove_index :posts, name: "index_posts_on_author_id"
    add_index :posts, :author_id
  end
end
