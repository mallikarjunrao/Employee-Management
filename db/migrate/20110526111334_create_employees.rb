class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.date :dob
      t.string :address
      t.string :phoneno
      t.string :mailid
      t.string :designation
      t.string :category_id
 	     t.string :subcategory_id
 
      t.timestamps
    end
  end

  def self.down
    drop_table :employees
  end
end
