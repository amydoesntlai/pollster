class CreatePollsTable < ActiveRecord::Migration

  def change
    create_table :polls do |t|
      t.string  :name
      t.string  :poll_link
      t.string  :admin_link

      t.timestamps
    end
  end

end