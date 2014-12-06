class BibleController < ApplicationController
  
  def index
    @page = {:title => "The Holy Bible", :head_title => "Bible"}
    
    if params[:passage] == "" || params[:passage] == nil
      @doc = "NONE"
    else
      bible = Bible.new
      @doc = bible.passageQuery(params[:passage])
    end
  end
  
end
