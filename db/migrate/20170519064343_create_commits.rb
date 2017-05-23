class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.text :content
      t.integer :article_id

      t.timestamps
    end
  end
end
