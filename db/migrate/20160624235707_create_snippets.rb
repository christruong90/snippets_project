class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :kind
      t.text :title
      t.text :work

      t.timestamps null: false
    end
  end
end
