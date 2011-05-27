class Employee < ActiveRecord::Base
belongs_to :subcategory
cattr_reader :per_page
@@per_page = 10 


has_attached_file :file
has_attached_file :avatar



 def self.search_users(query)
    return Employee.where("(firstname LIKE ? OR lastname LIKE ? OR middlename LIKE ? )",1,0, "%#{query}%", "%#{query}%", "%#{query}%")
  end
end
