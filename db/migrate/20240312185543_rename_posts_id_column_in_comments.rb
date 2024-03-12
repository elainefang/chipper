class RenamePostsIdColumnInComments < ActiveRecord::Migration[7.1]
  def change
    rename_column :comments, :posts_id, :post_id
  end
end
