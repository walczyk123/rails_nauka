# README

## User excercises  

Excercises for toy app

* CSS id for text "User was syccessfuly created" -> id="notice"  

* new user without mail? -> no problem, created withoud mail  

* new user with invalid adress -> created with shitty mail  

* destroying all of users -> 1) "Are you sure?" 2) "user was succesfully destroyed"  

Excercises for toy app user actions:  

* @users variable was defined when user panel was open. Then, when edit was pressed, you get redirect to user edit view. Edit view (edit.html.erb) shows 1- editing user, 2- shows @user data, 3 is button that shows particular user view, 4 is link to users list.  

* cant find line in scaffolding (edit: here you go: @user = User.find(params[:id]))  

* user edit view is edit.html.erb  

My issues to this moment:  

* no data validation like in 2 and 3 excercise,  

* there is no need to have permisions to edit sth,  

* its completly plain, everything looking like a 8-year old child html page  

## microposts excercises  

* CSS id for "Micropost was succesfully created" -> id="notice"   same id as in users, i think bc scaffold do excactly the same things in both cases.  

* Empty content micropost and with no id -> just creating new empty mictopost, like in users  

* over 140-chars micropost content -> created with an ease  

excercises after content validation:  

* cant create over 140 char length content, but no error is shown

* no error shown - no id to check,  (i'll check on other browser)

Merged user with his microposts excercises:  

* done, user show page now outputs name, email and first post 

* done, but did this by validates :content, length: { maximum: 140, minimum: 1 } insted of presence: true  

* did done:  validates :name, presence: true,  validates :email, presence: true  

My issues to this moment:  

* users with no micropost, eg. the new one, will not show up, bc lack of this object.  

