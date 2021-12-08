class ApplicationController < ActionController::Base
  before_action(:load_current_user_info)
  
  # Uncomment this if you want to force user_infos to sign in before any other actions
  before_action(:force_user_info_sign_in)
  
  def load_current_user_info
    the_id = session[:user_info_id]
    @current_user_info = UserInfo.where({ :id => the_id }).first
    cookies.store(:user_id, @current_user_info.id)
  end
  
  def force_user_info_sign_in
    if @current_user_info == nil
      redirect_to("/user_info_sign_in", { :notice => "You have to sign in first." })
    end
  end

end
