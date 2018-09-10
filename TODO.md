# To-do list for Sinatra Messages Transfer Project
- This project is a simple version mimicking a social app by imitating connections between a user, his/her friends and their messages
- Be able to create a user, view list of existing users, make friends with them and send/receive messages
- Always add descriptive comments and to-do task within code
- Be a productive coder

## Models
- There will be 3 main models : User, Friend and Message
- User has_many Friends and Messages
- Friend has_many Messages
- Message belongs_to a User and a Friend

## Controller
- Application Controller
- UsersController
- MessageController
- FriendsController

## View
- layout.erb - repeated lay out
- index.erb - Home Page (sign in, sign up)
- separated view pages for User, Friend and Message

### Views/Users
- index.erb - pop-up notification for new messages, link to view all messages, link to compose message to friend, link to views friends
- new_user.erb - create an account (sign up), redirect to users/index.erb
- login.erb - log in form, redirect to users/index.erb

### Views/Friends
- friends.erb - view all friends (link to friend's infos, link to make new friend, link to unfriend)
- new_friend.erb - view all users and choose one or more to make friend
- unfriend.erb - unfriend one or more friend
- friend-infos.erb - view single friend infomation

### Views/Messages
- messages.erb - view all message (link to compose a new message, edit a message and delete a message)
- new_message - compose message to a friend, redirect to messages/message.id
- edit_message - edit an existing message, redirect to messages/message.id
- delete_message - delete a message, redirect to messages.erb