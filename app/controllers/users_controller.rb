class UsersController < ApplicationController
  def create
    #Parameters: {"query_username"=>"batman"}
    new_user=User.new
    new_user.username=params.fetch("query_username")
    new_user.save
    redirect_to("/users")
  end
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })
    render({ :template => "user_templates/index" })
  end

  def show
    # Parameters: {"path_username"=> "anisa"}
    url_username = params.fetch("path_username")
    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.at(0)

    if @the_user == nil
      redirect_to("/404")
    else
      render({ :template => "user_templates/show" }) 
    end
  end
end
