class UserInfoAuthenticationController < ApplicationController
  # Uncomment this if you want to force user_infos to sign in before any other actions
  # skip_before_action(:force_user_info_sign_in, { :only => [:sign_up_form, :create, :sign_in_form, :create_cookie] })

  def sign_in_form
    render({ :template => "user_info_authentication/sign_in.html.erb" })
  end

  def create_cookie
    user_info = UserInfo.where({ :email => params.fetch("query_email") }).first
    
    the_supplied_password = params.fetch("query_password")
    
    if user_info != nil
      are_they_legit = user_info.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/user_info_sign_in", { :alert => "Incorrect password." })
      else
        session[:user_info_id] = user_info.id
      
        redirect_to("/", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/user_info_sign_in", { :alert => "No user_info with that email address." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end

  def sign_up_form
    render({ :template => "user_info_authentication/sign_up.html.erb" })
  end

  def create
    @user_info = UserInfo.new
    @user_info.email = params.fetch("query_email")
    @user_info.password = params.fetch("query_password")
    @user_info.password_confirmation = params.fetch("query_password_confirmation")
    @user_info.phone_number = params.fetch("query_phone_number")
    @user_info.username = params.fetch("query_username")
    @user_info.first_name = params.fetch("query_first_name")
    @user_info.last_name = params.fetch("query_last_name")

    save_status = @user_info.save

    if save_status == true
      session[:user_info_id] = @user_info.id
   
      redirect_to("/", { :notice => "User info account created successfully."})
    else
      redirect_to("/user_info_sign_up", { :alert => "User info account failed to create successfully."})
    end
  end
    
  def edit_profile_form
    render({ :template => "user_info_authentication/edit_profile.html.erb" })
  end

  def update
    @user_info = @current_user_info
    @user_info.email = params.fetch("query_email")
    @user_info.password = params.fetch("query_password")
    @user_info.password_confirmation = params.fetch("query_password_confirmation")
    @user_info.phone_number = params.fetch("query_phone_number")
    @user_info.username = params.fetch("query_username")
    @user_info.first_name = params.fetch("query_first_name")
    @user_info.last_name = params.fetch("query_last_name")
    
    if @user_info.valid?
      @user_info.save

      redirect_to("/", { :notice => "User info account updated successfully."})
    else
      render({ :template => "user_info_authentication/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_user_info.destroy
    reset_session
    
    redirect_to("/", { :notice => "UserInfo account cancelled" })
  end
 
  def index

    matching_users = UserInfo.all

    @list_of_users = matching_users.order({ :created_at => :desc })


    render("/user_info_authentication/index.html.erb")

  end

  def show
    the_id = params.fetch("path_id")

    matching_user = UserInfo.where({ :id => the_id })

    @the_user = matching_user.at(0)

    user_id = @the_user.id
    list_of_saved_items = SavedItem.where({:user_id => user_id})
    matching_saved_item = list_of_saved_items.at(0) 
    the_item_id = matching_saved_item.item_id 
    item_info = Item.where({:id => the_item_id}) 
    @list_of_user_items = item_info.order({ :created_at => :desc }) 
    
    render({ :template => "user_info_authentication/show.html.erb" })
  end
end
