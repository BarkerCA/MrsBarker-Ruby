class HomeController < ApplicationController
  
  def index
    @page = {:title => "Welcome!", :head_title => "Home"}
  end
  
end
