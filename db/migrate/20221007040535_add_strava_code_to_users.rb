class AddStravaCodeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :strava_code, :string
  end
end
