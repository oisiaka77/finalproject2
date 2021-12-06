Rails.application.routes.draw do



  # Routes for the Clothing category resource:

  # CREATE
  post("/insert_clothing_category", { :controller => "clothing_categories", :action => "create" })
          
  # READ
  get("/clothing_categories", { :controller => "clothing_categories", :action => "index" })
  
  get("/clothing_categories/:path_id", { :controller => "clothing_categories", :action => "show" })
  
  # UPDATE
  
  post("/modify_clothing_category/:path_id", { :controller => "clothing_categories", :action => "update" })
  
  # DELETE
  get("/delete_clothing_category/:path_id", { :controller => "clothing_categories", :action => "destroy" })

  #------------------------------

  # Routes for the Store resource:

  # CREATE
  post("/insert_store", { :controller => "stores", :action => "create" })
          
  # READ
  get("/stores", { :controller => "stores", :action => "index" })
  
  get("/stores/:path_id", { :controller => "stores", :action => "show" })
  
  # UPDATE
  
  post("/modify_store/:path_id", { :controller => "stores", :action => "update" })
  
  # DELETE
  get("/delete_store/:path_id", { :controller => "stores", :action => "destroy" })

  #------------------------------

  # Routes for the Item resource:

  # CREATE
  post("/insert_item", { :controller => "items", :action => "create" })
          
  # READ
  get("/items", { :controller => "items", :action => "index" })
  
  get("/items/:path_id", { :controller => "items", :action => "show" })
  
  # UPDATE
  
  post("/modify_item/:path_id", { :controller => "items", :action => "update" })
  
  # DELETE
  get("/delete_item/:path_id", { :controller => "items", :action => "destroy" })

  #------------------------------

  # Routes for the Friendship resource:

  # CREATE
  post("/insert_friendship", { :controller => "friendships", :action => "create" })
          
  # READ
  get("/friendships", { :controller => "friendships", :action => "index" })
  
  get("/friendships/:path_id", { :controller => "friendships", :action => "show" })
  
  # UPDATE
  
  post("/modify_friendship/:path_id", { :controller => "friendships", :action => "update" })
  
  # DELETE
  get("/delete_friendship/:path_id", { :controller => "friendships", :action => "destroy" })

  #------------------------------

  # Routes for the Saved item resource:

  # CREATE
  post("/insert_saved_item", { :controller => "saved_items", :action => "create" })
          
  # READ

  get("/", { :controller => "saved_items", :action=> "index"})
  get("/saved_items", { :controller => "saved_items", :action => "index" })
  
  get("/saved_items/:path_id", { :controller => "saved_items", :action => "show" })
  
  # UPDATE
  
  post("/modify_saved_item/:path_id", { :controller => "saved_items", :action => "update" })
  
  # DELETE
  get("/delete_saved_item/:path_id", { :controller => "saved_items", :action => "destroy" })

  #------------------------------

  # Routes for the User info account:

  get("/users",{:controller => "user_info_authentication", :action=> "index"})

  get("/users/:path_id",{:controller => "user_info_authentication", :action=> "show"})
  

  # SIGN UP FORM
  get("/user_info_sign_up", { :controller => "user_info_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user_info", { :controller => "user_info_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_info_profile", { :controller => "user_info_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user_info", { :controller => "user_info_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_info_account", { :controller => "user_info_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_info_sign_in", { :controller => "user_info_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_info_verify_credentials", { :controller => "user_info_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_info_sign_out", { :controller => "user_info_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
