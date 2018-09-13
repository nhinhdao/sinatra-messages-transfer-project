require 'rack-flash'
# Routes for Messages Flow
class MessagesController < ApplicationController
  use Rack::Flash
  # view all users' sent and inbox messages
  get '/messages/messages' do
    erb :'/messages/messages'
  end

  # compose new message to a friend
  get '/messages/new_message' do
    erb :'messages/new_message'
  end

  post '/messages/send_message' do
    # binding.pry
    @message = Message.create(content: params[:message][:content], user_id: current_user.id, friend_id: params[:message][:friend_id])
    flash[:sent] = "Message was sent to #{@message.friend.username}"
    redirect :"/messages/#{@message.id}"
  end

  # view a single message
  get '/messages/:id' do
    @message = Message.find(params[:id])
    erb :'messages/show_message'
  end

  # edit a message that belongs to user only
  get '/messages/:id/edit' do
    # binding.pry
    @message = Message.find(params[:id])
    if @message && @message.user == current_user
      erb :'/messages/edit_message'
    else
      flash[:message_edit] = "Sorry. You can not edit the message was sent by #{@message.friend.username}."
      redirect "/messages/#{@message.id}"
    end
  end

  patch '/messages/:id' do
    @message = Message.find(params[:id])
    @message.update(content: params[:message][:content])
    redirect "/messages/#{@message.id}"
  end

  # delete a message
  delete '/messages/:id' do
    @message = Message.find(params[:id])
    @message.delete
    binding.pry
    redirect "/messages/messages"
  end
end
