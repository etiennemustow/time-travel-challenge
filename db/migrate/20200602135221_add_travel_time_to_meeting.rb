class AddTravelTimeToMeeting < ActiveRecord::Migration[5.2]
  def change
    add_column :meetings, :travel_time, :integer
  end
end
