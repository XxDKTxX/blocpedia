class Wiki < ApplicationRecord
  belongs_to :user
  
  before_save { wiki.private ||= false }
  scope :visible_to, -> (user) { user ? all : where(private: false) }
  
  def publicize
    update_attribute(:private, false)
  end
end
