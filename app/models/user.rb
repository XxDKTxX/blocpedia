class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
         enum role: [:standard, :premium, :admin]
         has_many :wikis
         before_save { self.role ||= :standard }
         
  def going_public
    self.wikis.each { |wiki| puts wiki.publicize }
  end
         

end
