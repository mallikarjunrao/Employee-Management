class Employee < ActiveRecord::Base
belongs_to :subcategory
cattr_reader :per_page
@@per_page = 10 


has_attached_file :file
has_attached_file :avatar
end
