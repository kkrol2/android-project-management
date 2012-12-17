class RegistrationsController < Devise::RegistrationsController
layout 'admin'


private
    def prevent_sign_up
        redirect_to new_admin_session_path and return
    end
end