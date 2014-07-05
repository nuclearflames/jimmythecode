class Users::RegistrationsController < Devise::RegistrationsController
	def create
		if params[:user][:email] != "nuclearflames@gmail.com"
			flash[:notice] = "Registrations closed"
        	redirect_to :controller => '/home', :action => 'index'
        else
        	super
    	end
	end
end
