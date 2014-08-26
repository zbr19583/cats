class FixDate < ActiveRecord::Migration
  def change
    remove_column :cats, :birth_date, :date
    
    add_column :cats, :birth_date, :date, presence: true
  end
end
