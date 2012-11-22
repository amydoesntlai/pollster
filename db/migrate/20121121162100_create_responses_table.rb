class CreateResponsesTable < ActiveRecord::Migration

  def change
    create_table :responses do |t|
      t.string  :content
      t.integer :poll_id

      t.timestamps
    end
  end

end