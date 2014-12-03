class NatalieController < ApplicationController
  before_action :set_child, only: [:index]
  
  def index
    @page = {:title => "#{@child.fname} #{@child.lname}", :head_title => "#{@child.fname} Home"}
    @birthday = @child.dob
  end
  
  def set_child
    @child = Child.find_by(fname: 'Natalie')
  end
end
