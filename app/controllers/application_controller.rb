class ApplicationController < ActionController::Base
  protect_from_forgery



 def per_page
    if params[:per_page]
      @per_page = params[:per_page]
    else
      @per_page = 10
    end 
  end
  
  def page 
     if params[:page]
     	@page = params[:page]
     else
     	 @page=1
     end
  end
end
