class ChangeDefaultStatusToPendingLocations < ActiveRecord::Migration[6.1]
  def change
    change_column_default :bookings, :status, 0
  end
end
