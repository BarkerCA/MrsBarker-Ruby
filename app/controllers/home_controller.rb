class HomeController < ApplicationController
  
  def index
    @page = {:title => "Home", :head_title => "Home"}
  end
  
end
