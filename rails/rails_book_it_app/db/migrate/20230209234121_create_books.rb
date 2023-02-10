class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :summary
      t.datetime :published_date
      t.string :image_path

      t.timestamps
    end
  end
end
