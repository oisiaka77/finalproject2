class FriendshipsController < ApplicationController
  def index
    matching_friendships = Friendship.all

    @list_of_friendships = matching_friendships.order({ :created_at => :desc })

    render({ :template => "friendships/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_friendships = Friendship.where({ :id => the_id })

    @the_friendship = matching_friendships.at(0)

    render({ :template => "friendships/show.html.erb" })
  end

  def create
    the_friendship = Friendship.new
    the_friendship.sender_id = params.fetch("query_sender_id")
    the_friendship.receiver_id = params.fetch("query_receiver_id")

    if the_friendship.valid?
      the_friendship.save
      redirect_to("/friendships", { :notice => "Friendship created successfully." })
    else
      redirect_to("/friendships", { :notice => "Friendship failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_friendship = Friendship.where({ :id => the_id }).at(0)

    the_friendship.sender_id = params.fetch("query_sender_id")
    the_friendship.receiver_id = params.fetch("query_receiver_id")

    if the_friendship.valid?
      the_friendship.save
      redirect_to("/friendships/#{the_friendship.id}", { :notice => "Friendship updated successfully."} )
    else
      redirect_to("/friendships/#{the_friendship.id}", { :alert => "Friendship failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_friendship = Friendship.where({ :id => the_id }).at(0)

    the_friendship.destroy

    redirect_to("/friendships", { :notice => "Friendship deleted successfully."} )
  end
end
