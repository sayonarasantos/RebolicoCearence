class Event < ApplicationRecord
  belongs_to :user
  
  def self.search(search)
    where("title LIKE ?", "%#{search}%") 
    where("neighborhood LIKE ?", "%#{search}%")
  end
  
  
  
end
