module ApplicationHelper
 def per_page
      select_tag :per_page, options_for_select([10,20,30,50], @per_page.to_i), :onchange => "if(this.value){window.location='?per_page='+this.value+'&page=#{@page}'+'&query=#{@query}'}"
  end
end
