class EmployeesController < ApplicationController
  # GET /employees
  # GET /employees.xml
  def index
 @employees = Employee.all
#@employees = Employee.paginate(:all, :page => params[:page], :order => 'created_at DESC')
 @employees= Employee.paginate(:all,:page =>page, :per_page =>per_page , :order =>"created_at  DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @employees }
    end
  end


def load_subcategories
  @subcategories = Subcategory.find(:all,:conditions => ['category_id = ?' ,params[:id]])
   respond_to do |format|
   format.js{
   render :update do |page| 
      page[:employee_subcategory_id].replace collection_select(:employee,:subcategory_id, @subcategories , :id, :name,{:prompt=> 'Select Subcategory'})
       end
      }
   end
  end
  # GET /employees/1
  # GET /employees/1.xml
  def show
    @employee = Employee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @employee }
    end
  end

  # GET /employees/new
  # GET /employees/new.xml
  def new
    @employee = Employee.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @employee }
    end
  end

  # GET /employees/1/edit
  def edit
    @employee = Employee.find(params[:id])
  end

  # POST /employees
  # POST /employees.xml
  def create
    @employee = Employee.create(params[:employee])

    respond_to do |format|
      if @employee.save
        format.html { redirect_to(@employee, :notice => 'Employee was successfully created.') }
        format.xml  { render :xml => @employee, :status => :created, :location => @employee }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @employee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /employees/1
  # PUT /employees/1.xml
  def update
    @employee = Employee.find(params[:id])

    respond_to do |format|
      if @employee.update_attributes(params[:employee])
        format.html { redirect_to(@employee, :notice => 'Employee was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @employee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.xml
def delete_user_photo

@employee=Employee.find(params[:id])
@employee.avatar.destroy
  respond_to do |format|
      if @employee.save
      flash[:notice] = "saved" 
      else
      flash[:notice] = "Not saved" 
      end
      format.html { redirect_to employees_path }
      format.xml  { head :ok }      
 end
end


def search_users
    # action used to display mentors and mentees based on the search query.  
   if params['search'].strip.empty?
    @search_users = []
    flash[:notice] = "No search results found"          
   else
    @search_users = Employee.search_users(params['search']).where('role_id != ?',1) 
    flash[:notice] = "Number of search results found #{@search_users.count}" 
   end   
  end  

def search
    if params['search'].strip.empty?
       flash[:notice] = "Please provide a Mentor / Mentee name." 
       redirect_to :action => 'index'         
    else
	    @search_users = Employee.search_users(params['search'])
      respond_to do |format|
         format.html { redirect_to(:action => "search_users") }
      end
    end    
  end


  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to(employees_url) }
      format.xml  { head :ok }
    end
  end
end
