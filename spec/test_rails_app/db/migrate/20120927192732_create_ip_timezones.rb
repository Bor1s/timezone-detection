class CreateIpTimezones < ActiveRecord::Migration
  def change
    create_table :timezone_detection_ip_timezones do |t|
      t.column :ip_in_longint, "INT UNSIGNED", default: 0
      t.integer :utc_offset
    end

    add_index :timezone_detection_ip_timezones , :ip_in_longint
  end
end
