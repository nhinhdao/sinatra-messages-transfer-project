# Routes for User Interaction
class UsersController < ApplicationController
  get '/signup' do
    if !logged_in?
      erb :'users/create_user'
    else
      erb :'users/current_user'
    end
  end

  # TODO: Show warning when user tries to create account with missing information
  post '/signup' do
    @user = User.new(params[:user])
    if @user.save
      session[:id] = @user.id
      redirect :"users/current_user"
    else
      redirect :'/signup'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      erb :'users/current_user'
    end
  end

  # TODO: Show warning when user gives wrong informations that don't match record
  post '/login' do
    @user = User.find_by(params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:id] = @user.id
      erb :"users/current_user"
    else
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
    @user = User.find_by_id(params[:id])
    @user.delete
    redirect '/users/friends'
  end

# TODO: delete_if doesn't work, check User.all
  get '/users/new_friend' do
    erb :'users/new_friend'
  end

  post '/users/create_friends' do
    # params[:friends] = [2,3,...]
    params[:friends].each do |i|
      if a = User.find_by_id(i)
        current_user.friends << a
        current_user.save
      else
        redirect '/users/friends'
      end
    end
    redirect '/users/friends'
  end
end
