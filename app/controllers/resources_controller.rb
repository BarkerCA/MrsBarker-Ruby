class ResourcesController < ApplicationController
  
  def index
    @page = {:title => "Resources", :head_title => "Resources"}
  end
  
end
