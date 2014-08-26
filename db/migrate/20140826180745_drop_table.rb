class DropTable < ActiveRecord::Migration
  def change
    drop_table :cats
  end
end
