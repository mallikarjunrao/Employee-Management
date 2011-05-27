class Employee < ActiveRecord::Base
belongs_to :subcategory
cattr_reader :per_page
@@per_page = 10 
end
