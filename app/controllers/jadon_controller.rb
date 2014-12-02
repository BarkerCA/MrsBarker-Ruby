class JadonController < ApplicationController
  before_action :set_child, only: [:index]
  
  def index
    
  end
  
  def set_child
    @child = Child.find_by(fname: 'Jadon')
  end
end
