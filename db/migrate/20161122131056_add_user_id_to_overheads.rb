class AddUserIdToOverheads < ActiveRecord::Migration
  def change
    add_column :overheads, :user_id, :integer
  end
end
