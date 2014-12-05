class ResourcesController < ApplicationController
  
  def index
    @page = {:title => "Resources", :head_title => "Resources"}
  end
  
  def go
    @loc = params[:loc]
    
    if @loc == 'esv'
      redirect_to '/resources/bible/esv'
    end
    
  end

end
