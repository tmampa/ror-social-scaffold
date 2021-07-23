class FriendshipsController < ApplicationController
  def create
    user = User.find(params[:friend_id])
    @add_friend = current_user.friendships.new(friend_id: user.id, status: false)
    if @add_friend.save
      redirect_to users_path, notice: 'Friend request sent.'
    else
      redirect_to users_path, alert: 'You friend request was not sent.'
    end
  end

  def confirm_friend
    update_attributes(confirmed: true)
    Friendship.create!(friend_id: user_id,
                       user_id: friend_id,
                       confirmed: true)
  end
end
