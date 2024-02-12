class UsersController < ApplicationController
  def create
    #Parameters: {"query_username"=>"batman"}
    new_user=User.new
    new_user.username=params.fetch("query_username")
    new_user.save
    next_url="/users/"+new_user.username
    redirect_to(next_url)
  end
  def update
    #Parameters: {"query_username"=>"auguston"}
    the_username=params.fetch("toast_username")
    matching_users=User.where(:username=>the_username)
    the_user=matching_users.at(0)

    input_username = params.fetch("query_username")

    the_user.username= input_username
    the_user.save

    next_url="/users/"+the_user.username.to_s
    redirect_to(next_url)
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
