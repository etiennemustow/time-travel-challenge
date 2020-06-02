class AddNameToJourney < ActiveRecord::Migration[5.2]
  def change
    add_column :journeys, :name, :string
  end
end
