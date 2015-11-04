class Song < ActiveRecord::Base
  validates_presence_of :title, :artist      #something has to be entered in these fields
end
