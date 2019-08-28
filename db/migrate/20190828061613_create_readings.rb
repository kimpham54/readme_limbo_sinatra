class CreateReadings < ActiveRecord::Migration[5.2]
  def change
  	create_table :readings do |t|
  		t.string :title
  		t.string :url
  		t.string :notes
  		t.integer :user_id
  		t.timestamps
  	end
  end
end
