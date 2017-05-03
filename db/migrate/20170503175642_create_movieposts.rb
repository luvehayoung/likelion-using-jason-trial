class CreateMovieposts < ActiveRecord::Migration
  def change
    create_table :movieposts do |t|
      t.string :title
      t.string :released
      t.string :poster

      t.timestamps null: false
    end
  end
end
