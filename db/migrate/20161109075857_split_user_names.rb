class SplitUserNames < ActiveRecord::Migration[5.0]
  def change
		change_table :users do |t|
			t.rename :name, :first_name
			t.string :last_name
		end
  end
end
