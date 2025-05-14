class StaticPagesController < ApplicationController
  def home
    if logged_in?
      # ユーザとそのフォロー中のユーザのツイート(タイムラインのツイート)を表示 
      following_ids = "SELECT followed_id FROM follow_relationships WHERE follower_id = :user_id" 
      @tweets=Tweet.where("user_id IN (#{following_ids}) OR user_id = :user_id", user_id: current_user.id).order(created_at: "DESC") 
      @new_tweet = current_user.tweets.new 
    end
  end
end
