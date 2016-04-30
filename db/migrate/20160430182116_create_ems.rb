class CreateEms < ActiveRecord::Migration
  def change
    create_table :ems do |t|

      t.string "title"
      t.string "adds"
      t.string "content"
      
      t.timestamps null: false
    end
  end
end
