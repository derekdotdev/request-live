class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.string :artist
      t.string :title
      t.text :comments

      t.timestamps
    end
  end
end
