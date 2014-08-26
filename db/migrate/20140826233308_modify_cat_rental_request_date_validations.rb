class ModifyCatRentalRequestDateValidations < ActiveRecord::Migration
  def change
    remove_column :cat_rental_requests, :start_date, :date
    remove_column :cat_rental_requests, :end_date, :date
    
    add_column :cat_rental_requests, :start_date, :date, presence: true
    add_column :cat_rental_requests, :end_date, :date, presence: true
  end
end
