class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :seat, index: true
      t.references :voter, index: true
      t.references :candidate, index: true

      t.timestamps
    end
  end
end
