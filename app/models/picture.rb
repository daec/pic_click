class Picture < ActiveRecord::Base
  attr_accessible :filename
  
  validates :filename, :uniqueness => true
  after_destroy :remove_file
  
  
  
  
  private
  def remove_file
    File.delete("app/assets/images/" + filename)
  end
end
