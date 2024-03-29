class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string      :title
      t.text         :text
      t.references   :user, foreign_key: true
      t.timestamps null: true
    end
  end
end
