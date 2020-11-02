class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.integer   :number,             null:false
      t.integer   :month,              null:false
      t.integer   :year,               null:false
      t.integer   :security_code,      null:false
      t.timestamps
    end
  end
end
