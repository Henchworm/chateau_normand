class CreateRuns < ActiveRecord::Migration[7.0]
  def change
    create_table :runs do |t|
      t.jsonb :data

      t.timestamps
    end
  end
end
