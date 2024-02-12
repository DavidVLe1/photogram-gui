Rails.application.routes.draw do
  get("/users", {:controller => "users", :action =>"index"})
  get("/users/:path_username", {:controller => "users", :action =>"show"})
  get("/photos", {:controller =>"photos", :action =>"index"})
  get("/photos/:path_id", {:controller =>"photos", :action =>"show"})
  get("/delete_photo/:toast_id", {:controller =>"photos", :action =>"delete"})
  post("/insert_photo_record", {:controller => "photos", :action=>"create"})
  post("/update_photo/:toast_id",{:controller => "photos", :action =>"update"})
  get("/",{:controller=>"users",:action=>"index"})
  post("/add_comment",{:controller => "photos", :action=>"commentate"})
end
