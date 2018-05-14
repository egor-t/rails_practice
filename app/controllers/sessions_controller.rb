
# Overide devise session controller(customize flash message after sign in)
class SessionsController < Devise::SessionsController
  def create
    super do |resource|
      flash[:notice] = "Hello - #{resource.first_name} #{resource.last_name}"
    end
  end
end
