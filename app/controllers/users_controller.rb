require 'rack-flash'
# Routes for User Interaction
class UsersController < ApplicationController
  use Rack::Flash
  get '/signup' do
    if !logged_in?
      erb :'users/create_user'
    else
      erb :'users/current_user'
    end
  end


  # and notice them when they successfully signed up
  post '/signup' do
    @user = User.new(params[:user])
    if @user.save
      session[:id] = @user.id
      flash[:notice] = "Thanks for signing up!"
      redirect :"users/current_user"
    else
      redirect :'/signup'
    end
  end


  # Log in page
  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      erb :'users/current_user'
    end
  end


  post '/login' do
  # binding.pry
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:id] = @user.id
      erb :"users/current_user"
    else
      flash[:error] = "User's Information does not match our record. Please try again or sign up for access"
      redirect :'/login'
    end
  end


  get '/users/current_user' do
    erb :'users/current_user'
  end


  get '/users/friends' do
    erb :'/users/friends'
  end


  delete '/users/:id' do
    # binding.pry
    @user = User.find_by_id(params[:id])
    Friendship.find_by(user_id: current_user.id, friend_id: @user.id).delete
    Friendship.find_by(user_id: @user.id, friend_id: current_user.id).delete
    redirect '/users/friends'
  end


  get '/users/new_friend' do
    # binding.pry
    erb :'users/new_friend'
  end


  post '/users/create_friends' do
    # params[:friends] = [2,3,...]
    # params[:friends].each do |i|
    #   if a = User.find_by_id(i)
    #     current_user.friends << a
    #     Friendship.create(user_id: current_user.id, friend_id: a.id)
    #   else
    #     redirect '/users/friends'
    #   end
    # end
    params[:friends].each do |i|
      a = User.find_by_id(i)
      # current_user.friends << a
      Friendship.create(user_id: current_user.id, friend_id: a.id)
      Friendship.create(user_id: a.id, friend_id: current_user.id)
      flash[:notice] = "Successfully connected to #{a.username}."
    end
    redirect '/users/friends'
  end


  get '/logout' do
    session.clear
    redirect '/'
  end
end
