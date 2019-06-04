Specifications for the Sinatra Assessment
Specs:

x Use Sinatra to build the app
    Sinatra is used to create the controller routes
    Controllers all inherit from Sinatra::Base
x Use ActiveRecord for storing information in a database
    Models User and VideoPost use ActiveRecord to store and persist data
x Include more than one model class (e.g. User, Post, Category)
    Model User and Model VideoPost exist
x Include at least one has_many relationship on your User model (e.g. User has_many Posts
    User has many created_video_posts
    User has many liked_video_posts
    VideoPost has many likers
x Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    VideoPost belongs to creator
x Include user accounts with unique login attribute (username or email)
    User must have unique username AND email in order to signup
x Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    VideoPosts can be created, viewed, edited, and deleted
x Ensure that users can't modify content created by other users
    Buttons to delete and edit can only be viewed by the creator
    Routes are also protected and redirect if session's user is not the creator
x Include user input validations
    User can't sign up without a username, email, AND password
    User can't edit with blank fields
    User can't create a video without both a title and video_link
    User must have unique username and email
x BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
    Flash messages for the following:
      When user attempts log in with wrong credentials
      When user attempts to create a VideoPost with a blank title or blank video_link
      When user attempts to edit VideoPost with blank title and blank video_link
      When user attempts to sign up with empty field
      When user attempts to sign up with non unique username or email
x Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
    README.md contains short description, install instruction, and the rest
Confirm

x You have a large number of small Git commits
x Your commit messages are meaningful
x You made the changes in a commit that relate to the commit message
x You don't include changes in a commit that aren't related to the commit message