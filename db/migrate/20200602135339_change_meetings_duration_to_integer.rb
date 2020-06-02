class ChangeMeetingsDurationToInteger < ActiveRecord::Migration[5.2]
  def change
    remove_column :meetings, :duration
    add_column :meetings, :duration, :integer
  end
end
