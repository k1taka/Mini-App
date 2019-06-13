class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.timestamps
      t.string      :name,null: false
      t.text        :text,null: false
      t.text        :image,null: false
      t.timestamps null: true

    end
  end
end
