class AddAPIKeyToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :api_key, :string
  end
end
