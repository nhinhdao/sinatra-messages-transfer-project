# To-do list for Sinatra Messages Transfer Project

-   This project is a very simple social app version mimicking connections between a user, his/her friends and their messages
-   Be able to create a user, view list of existing users, make friends with them and send/receive messages
-   Always add descriptive comments and to-do task within code
-   Be a productive coder

## Models

-   There will be 3 main models : User, Friend and Message
-   User has_many Friends and Messages
-   Friend has_many Messages
-   Message belongs_to a User and a Friend

## Controller

-   Application Controller
-   UsersController
-   MessageController
-   FriendsController

## View

-   layout.erb - repeated lay out
-   index.erb - Home Page (sign in, sign up)
-   separated view pages for User, Friend and Message

### Views/Users

-   current_user.erb - link to view all messages, link to compose message to friend, link to views friends...
-   create_user.erb - create an account (sign up), redirect to users/user.id
-   login.erb - log in form, redirect to users/user.id
-   friends.erb - view all friends (link to send message, link to unfriend)
-   new_friend.erb - view all users and choose one or more to make friend

### Views/Messages

-   messages.erb - view all message (show sent and inbox messages)
-   new_message - compose message to a friend, redirect to messages/message.id
-   edit_message - edit an existing message, redirect to messages/message.id
-   show_message - view a single message
