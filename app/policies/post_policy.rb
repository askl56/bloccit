 class PostPolicy < ApplicationPolicy 
 	def index?
 		true
 	end

  def update?
    user.present? && user.admin?
  end

end