class AddArrivalTimeandDepartureTimeToMeetings < ActiveRecord::Migration[5.2]
  def change
    add_column :meetings, :arrival_time, :time
    add_column :meetings, :departure_time, :time
  end
end
