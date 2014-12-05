class Child < ActiveRecord::Base
  has_many :grades
  has_many :journals
end
