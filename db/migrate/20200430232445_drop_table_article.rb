class DropTableArticle < ActiveRecord::Migration[5.2]
  def up
    drop_table :articles
  end

  def down
  end
end
