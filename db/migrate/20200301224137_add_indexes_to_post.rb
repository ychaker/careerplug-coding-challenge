class AddIndexesToPost < ActiveRecord::Migration[5.1]
  def change
    add_index :posts, :title
    add_index :posts, :body
  end
end
