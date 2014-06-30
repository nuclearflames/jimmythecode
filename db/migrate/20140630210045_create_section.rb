class CreateSection < ActiveRecord::Migration
	def change
		create_table :sections do |t|
			t.string	:title,		null: false, default: ""
			t.text		:content,		null: false, default: ""

      		t.timestamps
		end
	end
end
