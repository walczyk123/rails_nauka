# README

## Sample application 

* Notebook  
  * ActiveSupport::HashWithIndifferentAccess - implements hash where key can be symbol or string, and still they are the same. For eg. `:name = "name"`  
  * ActiveModel::SecurePassword - 
  
      
Links doesn't work in RM, but github reads them correctly.  
* [Link to Chapter 4 - Rails flavored Ruby](#chapter-4)  
  * [Arrays](#Arrays)
  * [Blocks](#Blocks)
  * [Hashes and symbols](#Hashes-and-symbols)
* [Link to Chapter 5 - Filling in layout](#chapter-5)  
* [Link to Chapter 6 - Modeling users](#chapter-6)  
* [Link to Chapter 7 - Sign up](#chapter-7)  
* [Link to Chapter 8 - Basic Login](#chapter-8)
  * [Login Form](#Login-Form)
  * [Finding and authenticating a user](#Finding-and-authenticating-a-user)
  * [Logging in](#Logging-in)
  * [Logout](#Logout)
* [Link to Chapter 9 - Advanced login](#chapter-9)
  * [Remember me](#remember-me)
  * [Login with remembering](#login-with-remembering)
  * [Forgetting users](#forgetting-users)
  * [Two subtle bugs](#two-subtle-bugs)
  * [Remember Me Checkbox](#remember-me-checkbox)
* [Link to Chapter 10 - Updating, showing and deleting users](#chapter-10)
  * [Updating Users](#updating-users)
  * [Unsuccessful Edits](#unsuccessful-edits)



# Chapter 3  

### common commands  

* rails db:migrate  

* rails test  

* rails server  


## Controller exercises  

* rails generate controller Foo bar baz  

* rails destroy controller Foo bar baz  

## New dynamic page exercise  

* Added Contact page successfully

## Changing root page  

* Changed root, done testing, works fine

## Issues
  ```bash
  assert_select: command not found 
  ```
  -> problem solved

# Chapter 4  

## Notebook  

* "" suports interpolation in strings, when '' dont  

## String exercises  

* ex1
  ``` ruby
  city = "krakow"  
  state = "malopolska"  
  ```
* ex2
  ``` ruby
  "#{city}, #{state}"  ->  "krakow, malopolska"
  ```

* ex3
  ``` ruby 
  "#{city}, #{state}"    
  ```
  (no diffrence between them)
* ex4
  ``` ruby
  '#{city}, #{state}' 
  ```
  ``` bash
  ->  "\#{city}, \#{state}"
  ```
## Objects and message passing exercises  

* ex1
  ``` ruby
  "racecar".length -> 7    
  ```
  ``` bash
    -> 7
  ```
* ex2
    ``` ruby  
    !!"racecar".reverse  
    ```  
    ``` bash
    -> "true"
    ```
* ex3
  ``` ruby  
  s = "racecar"  
  s == s.reverse ? "they are the same" : "kinda diffrent tho"  
  ```
  ``` bash
  -> "they are the same"  
  ```
* ex 4
  ``` ruby  
  s = "onomatopeja"  
  s == s.reverse ? "they are the same" : "kinda diffrent tho"  
  ```
  ``` bash  
  -> "kinda diffrent tho"  
  ```  
## Method definitions exercises  

* ex1  
  palindrome testing
    ```ruby  
    def palindrome_tester(s)  
        if s == s.reverse  
            puts "it's a palindrome!"  
        else
            puts "it's not a palindrome!"  
        end  
    end 
    ```
    ``` bash 
    >> palindrome_tester("kajak")  
    it's a palindrome!  
    => nil  
    
    >> palindrome_tester("kajaki")  
    it's not a palindrome!  
    => nil  
    ```
* ex2   
  Confirmed by puting "kajak" and "kajaki" in tester  

* ex3  
    ``` bash
    palindrome_tester("kajaki").nil?  
    it's not a palindrome!  
    => true  
    ```
## Other data structures  
### Arrays  

* ex1
  ``` bash
  a = "A man, a plan, a canal, Panama".split(', ')  
  a  
  => ["A man", "a plan", "a canal", "Panama"]  
  ```
* ex2
  ``` bash  
  s = a.join  
  s
  => "A mana plana canalPanama"  
  ```
* ex3  
  ``` bash
  spl = s.split(' ').join  
  spl  
  => "AmanaplanacanalPanama"  
  palindrome_tester(spl)  
  => it's not a palindrome!  
  palindrome_tester(spl.downcase)  
  =>it's a palindrome!  
  ``` 
* ex4
  ``` bash
  b = ("a".."z").to_a  
  b[7]  
  => "h"
  b[-7]  
  => "t"  
  ```
### Blocks  

* ex1  
  ``` ruby
  (0..16).each do |i|     
    puts "kwadratem liczby #{i} jest #{i**2}"  
  end 
   ```
  
  -> works fine, but output is kinda long, so i dont put it here  

* ex2  
    ``` ruby  
    def yaller(arr)  
       upc = arr.map{ |i| i.upcase}  
       puts upc.join  
    end 
    ``` 
    ``` bash
    -> yaller(['o','l','d'])`  
    OLD  
    ```  
* ex3  
  ``` ruby 
  def random_subdomain  
    letters = ('a'..'z').to_a  
    sub_dom = (0..7).map {letters[rand(7)]}  
    puts sub_dom.join  
  end
  ```  
    ``` bash  
    random_subdomain  
    fgbdadcd  
    => nil  
    ```
* ex4
    ``` ruby
    def string_shuffle(s)  
        s.split('').shuffle.join    
      end  
      string_shuffle("foobar")  
    ```
    ``` bash
    string_shuffle("foobar")    
    => "oofrab"  
    ```

### Hashes and symbols  

* ex1
  ``` ruby
  lang = { one: "uno", two: "dos", tree: "tres" }   
  lang.each do |eng,esp|  
    puts "#{eng} in spanish is #{esp}"  
  end  
  ```
  ``` bash
  one in spanish is uno  
  two in spanish is dos  
  tree in spanish is tres  
  => {:one=>"uno", :two=>"dos", :tree=>"tres"}  
  ```
* ex2
  ``` ruby 
  person = {} 
  params = {} 
  person[:person1] = { frst: "name1", last: "last1" }  
  person[:person2] = { frst: "name2", last: "last2" }  
  person[:person3] = { frst: "name3", last: "last3" }  
  params[:father] = person[:person1]  
  params[:mother] = person[:person2]  
  params[:child] = person[:person3]  
  params[:father][:frst]  
  ``` 
  ``` bash
  => "name1"  
  ```
* ex3
  ``` ruby
  def random_pswd(lngth)  
    letters = ('a'..'z').to_a  
    pswd = (0..lngth).map {letters[rand(lngth)]}  
    return pswd.join  
  end   
  user = { name: "Kamil", email: "random@random.com", password: random_pswd(15) }  
  puts "#{user[:name]} ,#{user[:email]} ,#{user[:password]}"  
  ```
  ``` bash  
  Kamil ,random@random.com ,hmbhmnhffbgeiblm  
  => nil  
  ```
* ex4
  ``` ruby
  Returns a new ActionController::Parameters with all keys from other_hash merged into current hash.  
  {"a"=>100,"b"=>200}.merge({"b"=>300}) changes "b" in first hash to 300, so output is: "a"=100, "b"=300  
  ```
  
### Classes  

#### Constructors  

* `(1..10)` -> literal constructor, range constructor is just Range(1,10)  

* `c = Range.new(1,10)`  where 1 is starting point and 10 is end point  

* `(1..10)` -> literal constructor , `Range.new(1,10)` -> named constructor  
`(1..10) == Range.new(1,10)`
  ``` bash
  => true 
  ```

#### Inheritance  

* Inheritance hierarchy for:  
- Range - Object - Basic Object  
- Hash - Object - Basic Object  
- Symbol - object - Basic Object  

* ex1
  ``` ruby 
  class Word < String  
    def palindrome?  
      self == reverse  
    end  
  end  
  ```
  ``` bash
  s = Word.new("level")  
  s.palindrome?  
  => true  
  ```
#### Modyfing built-in classes  

* ex2
  ``` ruby
  class String  
    def palindrome?  
      self == self.reverse  
    end  
  end
  ```
  ``` bash  
  "racecar".palindrome?  
  => true  
  "onomatopeia".palindrome?  
  => false  
  "Malayalam".downcase.palindrome?  
  => true  
  ```
* ex3
  ```ruby
  class String  
    def shuffle  
      self.split('').shuffle.join    
    end  
  end
  ```
  ``` bash  
  "majo".shuffle
  => "amjo"
  ```
  
* ex4
  ``` ruby
  class String  
    def shuffle  
      split('').shuffle.join    
    end  
  end
  ```
  ``` bash  
  "majo".shuffle  
  => "oajm"  
  ````
#### Controller Class

* ex1
  ``` bash
  user = User.new  
  user.class  
  => User(id: integer, name: string, email: string, created_at: datetime, updated_at: datetime)  
  ```
  
* ex2
  ``` bash
  hierarchy  
  user - ApplicationRecord - ActiveRecord::Base - Object  
  ```
  
#### User Class  

* ex1
  ``` ruby
  class User  
    attr_accessor :first, :last, :email  
    
    def initialize(attributes = {})
      @first = attributes[:first]  
      @last = attributes[:last]   
      @email = attributes[:email]   
    end  
    
    def formated_email  
      "#{@first} #{last} <#{email}> "  
    end  
  end
  ```
  ``` bash         
  user = User.new(first: "Kamil", last: "Wlcz", email: "rand@rand.com")  
  user.formated_email  
  => "Kamil Wlcz <rand@rand.com> "  
  ```
  
* ex2
  ``` ruby
  class User  
    attr_accessor :first, :last, :email  
    
    def initialize(attributes = {})
      @first = attributes[:first]  
      @last = attributes[:last]   
      @email = attributes[:email]   
    end  
    
    def formated_email  
      "#{@first} #{last} <#{email}> "  
    end  
    
    def alph_name  
      "#{@first}_#{@last}"  
    end  
  end
  ```
  ``` bash
  user = User.new(first: "Kamil", last: "Wlcz", email: "rand@rand.com")  
  user.alph_name      
  => "Kamil_Wlcz"  
  ```
  
* ex3
  ``` ruby
  class User  
    attr_accessor :first, :last, :email  
    
    def initialize(attributes = {})
      @first = attributes[:first]  
      @last = attributes[:last]   
      @email = attributes[:email]   
    end  
    
    def formated_email  
      "#{@first} #{last} <#{email}> "  
    end  
    
    def alph_name  
      "#{@first}_#{@last}"  
    end  
    
    def full_name  
      split('_')  
    end  
  end
  ```
  ``` bash
  user = User.new(first: "Kamil", last: "Wlcz", email: "rand@rand.com")  
  user.alph_name.full_name
  ```
## Chapter 5  

### Integration test  

* ex1  
  after changing about_path to contact_path in _footer partial, integration test has catched this   problem.  
  
* ex2  
  ASK RAD! or check it when rested.  (page 282)
  edit: understood.
  

## Chapter 6   

### new user exercises  

* ex1  
  ```bash
  User.new.class
  => User(id: integer, name: string, email: string, created_at: datetime, updated_at: datetime)
  User.new.class.superclass
  => ApplicationRecord(abstract)
  ```

* ex2  
  ```ruby
  class ApplicationRecord < ActiveRecord::Base
    #...
    #...
    #...
  end
  ```

### User object  

* ex1  
  ```bash
  foo.name.class
  => String
  foo.email.class
  => String
  ```

* ex2   
  ```bash
  foo.updated_at.class
  => NilClass
  foo.created_at.class
  => NilClass
  ```
  
### Finding user objects  

* ex1 - Find the user byname. Confirm thatfind_by_nameworks as well.
  ```bash
  User.find_by(name:ble)
  => #<User id: 1, name: "ble", email: "bl@bl.com", created_at: "2021-03-11 18:17:02.482912000     +0000", updated_at: "2021-03-11 18:17:02.482912000 +0000">
  User.find_by_name(ble)==User.find_by(name:ble)
  => true
  ```
  
* ex2 - User.allacts like an array, but confirmthat in fact it’s of classUser::ActiveRecord_Relation.
  ```bash
  >> User.all.class
  => User::ActiveRecord_Relation
  ```
  
* ex3 - Confirm that you can find the length of User.all by passing it the length method 
  ```bash
  User.all.length
  User Load (0.3ms)  SELECT "users".* FROM "users"
  => 4
  ```  

### Updating user objects  

* ex1 - Find the user by name. Confirm that find_by_nameworks as well.
  ```bash
  user = User.first
  User Load (0.4ms)  SELECT "users".* FROM "users" ORDER BY "users"."id" ASC LIMIT ?  [["LIMIT", 1]]
  user
  => #<User id: 1, name: "ble", email: "dzik@dzik.com", created_at: "2020-03-12 19:52:34.503747000 +0000", updated_at: "2021-03-12 19:52:34.504881000 +0000">
  user.name = "dzik"
  user.save
  TRANSACTION (0.1ms)  begin transaction
  User Update (0.5ms)  UPDATE "users" SET "name" = ?, "updated_at" = ? WHERE "users"."id" = ?  [["name", "dzik"], ["updated_at", "2021-03-12 19:57:41.194030"], ["id", 1]]
  TRANSACTION (100.0ms)  commit transaction
  => true
   user.name
  => "dzik"
  ```

* ex2 - Update the user’s email address using a call toupdate.
  ```bash
  User.first.update(email: "dzik@dzik.com")
  User Load (0.2ms)  SELECT "users".* FROM "users" ORDER BY "users"."id" ASC LIMIT ?  [["LIMIT", 1]]
  TRANSACTION (0.1ms)  begin transaction
  User Update (0.5ms)  UPDATE "users" SET "email" = ?, "updated_at" = ? WHERE "users"."id" = ?  [["email", "dzik@dzik.com"], ["updated_at", "2021-03-12 19:42:48.357524"], ["id", 1]]
  TRANSACTION (71.9ms)  commit transaction
  => true
  User.first.save
  User Load (0.4ms)  SELECT "users".* FROM "users" ORDER BY "users"."id" ASC LIMIT ?  [["LIMIT", 1]]
  => true
  User.first
  User Load (0.5ms)  SELECT "users".* FROM "users" ORDER BY "users"."id" ASC LIMIT ?  [["LIMIT", 1]]
  => #<User id: 1, name: "ble", email: "dzik@dzik.com", created_at: "2021-03-11 18:17:02.482912000 +0000", updated_at: "2021-03-12 19:42:48.357524000 +0000">
  ```
 
* ex3 - Confirm that you can change the magic columns directly by updatingthecreated_atcolumn using assignment and a save
  ```bash  
  >> User.first.update_attribute(:created_at, 1.year.ago)
  User Load (0.4ms)  SELECT "users".* FROM "users" ORDER BY "users"."id" ASC LIMIT ?  [["LIMIT", 1]]
  TRANSACTION (0.2ms)  begin transaction
  User Update (1.0ms)  UPDATE "users" SET "created_at" = ?, "updated_at" = ? WHERE "users"."id"   = ?  [["created_at", "2020-03-12 19:52:34.503747"], ["updated_at", "2021-03-12 19:52:34.504881"], ["id", 1]]
  TRANSACTION (132.4ms)  commit transaction
  => true
  User.first.created_at
  User Load (0.4ms)  SELECT "users".* FROM "users" ORDER BY "users"."id" ASC LIMIT ?  [["LIMIT", 1]]
  Thu, 12 Mar 2020 19:52:34.503747000 UTC +00:00
  ```

### User validation

* ex1 - In the console, confirm that a new user is currently valid.
  ```bash
  >> @user = User.new(name: "ziomek1", email: "ziom1@ziom.com")
   (2.0ms)  SELECT sqlite_version(*)
  >> @user.valid?
  => true
  ```

* ex2 - Confirm that the user created in Section 6.1.3 is also valid.
  ```bash
  >> user=User.new(name:"Michael Hartl",email:"michael@example.com")
  >> user.valid?
  => true
  ```
  
### Validating pressence

* Important to remember  

  ```bash
  >> user = User.new(name: "",email: "elo@elo")
   (1.0ms)  SELECT sqlite_version(*)
  >> user.valid?
  => false
  >> user.errors.full_messages
  => ["Name can't be blank"]
  ```

* ex1 - Make a new user called u and confirm that it’s initially invalid. What are the full error messages?
  ```bash
  >> u = User.new
   (0.8ms)  SELECT sqlite_version(*)
  >> u.valid?
  => false
  >> u.errors.full_messages
  => ["Name can't be blank", "Email can't be blank"]
  ```

* ex2 - Confirm that u.errors.messages is a hash of errors. How would you access just the email errors?

  ```bash
  >> u.errors.messages
  => {:name=>["can't be blank"], :email=>["can't be blank"]}
  >> u.errors.messages[:email]
  => ["can't be blank"] 
  ```
  
### Validating length
  * Make a new user with too-long name and email and confirm that it’s not valid.
  ```bash
  >> u = User.new(name:"n"*51,email:"e"*256)
   (0.9ms)  SELECT sqlite_version(*)
  >> u.valid?
  => false
  >> u.errors.message
  >> u.errors.messages
  => {:name=>["is too long (maximum is 50 characters)"], :email=>["is too long (maximum is 255 characters)"]}
  ```

* ex2 - What are the error messages generated by the length validation
  ```bash
  >> u.errors.messages
  => {:name=>["is too long (maximum is 50 characters)"], :email=>["is too long (maximum is 255 characters)"]}
  ```
  or
  ```bash
  >> u.errors.full_messages
  => ["Name is too long (maximum is 50 characters)", "Email is too long (maximum is 255 characters)"]
  ```
  
### Format validation

* Important to remember  
  %w[]    
  
* ex1 - Done in Rubular
  
* ex2 
  ```ruby
  VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  ```

* ex3 - Done in Rubular 
  
### Uniqueness validation

* Important to remember  
  rails db:migrate:reset -> db:drop db:create db:migrate  
  
* ASK RAD 
  bang! -> email.downcase!  
  normal -> self.email = email.downcase (optional self.email.downcase)  
  
* ex1  
  When before_save in user.rb is commented out, test gives negative RED    
  edit: after uncomment before_save, tests are going GREEN  
  
* ex2  
  edited before_save  
  ```ruby 
  before_save { email.downcase! }
  ```


### Secure password

* Important to remember  
  password -> hashed password  
  loging with password -> hashing password  
  compare two hashed passwords  
  .  
  hash function -> bcrypt  
  
* ex1 - Confirm that a user with valid name and email still isn’t valid overall.  
  ```bash
  >> u=User.new(name: "Badek", email: "jolo@wpier.olo")
  >> u.valid?
  User Exists? (0.4ms)  SELECT 1 AS one FROM "users" WHERE "users"."email" = ? LIMIT ?  [["email", "jolo@wpier.olo"], ["LIMIT", 1]]
  => false
  >> u2=User.new(name: "Badek", email: "jolo@wpier.olo", password: "elo", password_confirmation: "elo")
  >> u2.valid?
  User Exists? (0.6ms)  SELECT 1 AS one FROM "users" WHERE "users"."email" = ? LIMIT ?  [["email", "jolo@wpier.olo"], ["LIMIT", 1]]
  => true
  ```
  
* ex2 - What are the error messages for a user with no password?  
  ```bash
  >> u.errors.messages
  => {:password=>["can't be blank"]}
  ```
  This indicates, that password is required  
  
### Minimum password standards
  
* ex1 - Confirm that a user with valid name and email but a too-short password isn’t valid.
  ```bash
  >> r = User.new(name: "ziomek12", email: "ziom12@ziom.com", password: "1qaz", password_confirmation:"1qaz")
  >> r.valid?
  User Exists? (0.4ms)  SELECT 1 AS one FROM "users" WHERE "users"."email" = ? LIMIT ?  [["email", "ziom12@ziom.com"], ["LIMIT", 1]]
  => false
  ```  

* ex2 - What are the associated error messages?
  ```bash
  >> yt.valid?
  => false
  >> yt.errors.messages
  => {:password=>["is too short (minimum is 6 characters)"]}
  ```
  
### Creating and authenticating a user

* Important to remember:  
  user.authenticate returns false for invalid password and returns user when password is ok.
  
* ex1 -  Quit and restart the console, and then find the user created in this section.  
  ```bash
  >> User.find_by(name: "Kamil Wlcz")
  => #<User id: 1, name: "Kamil Wlcz", email: "wlcz.kml@gmail.end", created_at: "2021-03-19 17:23:50.609684000 +0000", updated_at: "2021-03-19 17:23:50.609684000 +0000", password_digest: [FILTERED]>
  ```
  
* ex2 - Try changing the name by assigning a new name and calling save. Why didn’t it work?  
  ```bash
  >> u=User.find_by(name: "Kamil Wlcz")
  >> u.name = "Rad Big"
  >> u.save
  TRANSACTION (0.2ms)  begin transaction
  User Exists? (0.3ms)  SELECT 1 AS one FROM "users" WHERE "users"."email" = ? AND "users"."id" !  = ? LIMIT ?  [["email", "wlcz.kml@gmail.end"], ["id", 1], ["LIMIT", 1]]
  TRANSACTION (0.1ms)  rollback transaction
  => false
  >> u.errors.messages
  => {:password=>["can't be blank", "is too short (minimum is 6 characters)"]}
  ```
  So I think you need to authenticate by password to edit some attributes, so this prevents to change for ex. password without password.

* ex3 - Update user’s name to use your name.
  ```bash
  >> u.update(name: "Rad Big", password:"elo123melo")
  TRANSACTION (0.1ms)  begin transaction
  User Exists? (0.3ms)  SELECT 1 AS one FROM "users" WHERE "users"."email" = ? AND "users"."id" != ? LIMIT ?  [["email", "wlcz.kml@gmail.end"], ["id", 1], ["LIMIT", 1]]
  User Update (0.5ms)  UPDATE "users" SET "name" = ?, "updated_at" = ?, "password_digest" = ? WHERE "users"."id" = ?  [["name", "Rad Big"], ["updated_at", "2021-03-19 17:52:24.588885"], ["password_digest", "$2a$12$yt7H.tBNCy64E3YJ/hWRRe/veQvJyBNhEiXfol3t/y/9k/pZqpMNW"], ["id", 1]]
  TRANSACTION (88.0ms)  commit transaction
  => true
  ```
  
## Chapter 7 

  Rails tree environments:
  Production:
  ```bash
  rails console --environment production
  ```
  Test:
  ```bash
  rails console --environment test
  ```
  Development:
  ```bash
  #default
  rails c 
  # or
  rails console --environment development
  ```
  It also works with short versions of environment names:
  ```bash
  rails c --environment p
  rails c --environment t
  rails c --environment d
  ```
  Also it works with short names of Server, Console or Test, f.eg.
  ```bash
  rails s --environment p
  ```

* ex1 - Visit /about in browser and use debug information the controller and action of the params hash 
  ```
  --- !ruby/object:ActionController::Parameters
  parameters: !ruby/hash:ActiveSupport::HashWithIndifferentAccess
  controller: static_pages
  action: about
  permitted: false
  ``

* ex2 - In the Rails console, pull the first user out of the database and assign it to the variable user. What is the output ofputs user.attributes.-to_yaml?
  
  ```bash
  >> user = User.first
  >> user
  => #<User id: 1, name: "Rad Big", email: "wlcz.kml@gmail.end", created_at: "2021-03-19 17:23:50.609684000 +0000", updated_at: "2021-03-19 17:52:24.588885000 +0000", password_digest: [FILTERED]>
  # to yaml
  >> puts user.attributes.to_yaml
  ---
  id: 1
  name: Rad Big
  email: wlcz.kml@gmail.end
  created_at: !ruby/object:ActiveSupport::TimeWithZone
  utc: 2021-03-19 17:23:50.609684000 Z
  zone: &1 !ruby/object:ActiveSupport::TimeZone
  name: Etc/UTC
  time: 2021-03-19 17:23:50.609684000 Z 
  updated_at: !ruby/object:ActiveSupport::TimeWithZone
  utc: 2021-03-19 17:52:24.588885000 Z
  zone: *1
  time: 2021-03-19 17:52:24.588885000 Z 
  password_digest: "$2a$12$yt7H.tBNCy64E3YJ/hWRRe/veQvJyBNhEiXfol3t/y/9k/pZqpMNW"
  => nil
  # y user.attributes
  >> y user.attributes
  ---
  id: 1
  name: Rad Big
  email: wlcz.kml@gmail.end
  created_at: !ruby/object:ActiveSupport::TimeWithZone
  utc: 2021-03-19 17:23:50.609684000 Z
  zone: &1 !ruby/object:ActiveSupport::TimeZone
  name: Etc/UTC
  time: 2021-03-19 17:23:50.609684000 Z
  updated_at: !ruby/object:ActiveSupport::TimeWithZone
  utc: 2021-03-19 17:52:24.588885000 Z
  zone: *1
  time: 2021-03-19 17:52:24.588885000 Z
  password_digest: "$2a$12$yt7H.tBNCy64E3YJ/hWRRe/veQvJyBNhEiXfol3t/y/9k/pZqpMNW"
  => nil
  #basically its the same 
  ```

### Users resource 

* ex1 - Using embedded Ruby, add the created_at and updated_at “magic column” attributes to the user show page
  ```html
  <%= @user.name %>, <%= @user.email %>, <%= @user.created_at %>, <%= @user.updated_at %>
  ```
* ex2 - Using embedded Ruby, addTime.now to the user show page. What happens when you refresh the browser?
  ```html
  <%= @user.name %>, <%= @user.email %>, <%= @user.created_at %>, <%= @user.updated_at %>, <%= Time.now %>
  ```
  Time on user page changes, nothing fancy, very predictable, 2/10

### Debugger

* ex1 - Use puts to display the value of the YAML form of the params hash.
  ```bash
  (byebug) puts @user.attributes.to_yaml
  ---
  id: 1
  name: Rad Big
  email: wlcz.kml@gmail.end
  created_at: !ruby/object:ActiveSupport::TimeWithZone
  utc: 2021-03-19 17:23:50.609684000 Z
  zone: &1 !ruby/object:ActiveSupport::TimeZone
  name: Etc/UTC
  time: 2021-03-19 17:23:50.609684000 Z
  updated_at: !ruby/object:ActiveSupport::TimeWithZone
  utc: 2021-03-19 17:52:24.588885000 Z
  zone: *1
  time: 2021-03-19 17:52:24.588885000 Z
  password_digest: "$2a$12$yt7H.tBNCy64E3YJ/hWRRe/veQvJyBNhEiXfol3t/y/9k/pZqpMNW"
  nil
  (byebug) puts params.to_yaml
  --- !ruby/object:ActionController::Parameters
  parameters: !ruby/hash:ActiveSupport::HashWithIndifferentAccess
  controller: users
  action: show
  id: '1'
  permitted: false
  nil
  (byebug) 
  ```

* ex2 - Put the debugger in the User new action and hit /users/new. What is the value of@user?
  ```bash
  (byebug) puts @user
  nil
  ```
  Its just nil, maybe because we haven't assigned any attributes to this user yet?

### Gravatar img and sidebar

* ex1 - MD5 hash associated with image
  ```bash
  >> Digest::MD5::hexdigest(u.email.downcase)
  => "b147e88b86bb5a1a9f0923a392e07eab"
  ```
  
* ex2 -  Verify that the code in Listing 7.12 allows the gravatar_for helper defined inSection 7.1.4to take an optional size parameter,  
  __IDK, for now it just not working__
    
* ex3 - The options hash used in the previous exercise is still commonly used, but as of Ruby 2.0 we can use keyword arguments instead.  
  __Done__
  
### Signup form

* ex1 - Learn Enough HTML to Be Dangerous, in which all HTML is written by hand, doesn’t cover the form tag. Why not?  
  __form tag is rails method not an HTML method?__
  
### Unsuccessful signups 

* ex1 - 
  ```html-- !ruby/object:ActionController::Parameters
  parameters: !ruby/hash:ActiveSupport::HashWithIndifferentAccess
  admin: '1'
  controller: users
  action: new
  permitted: false
   ```
  
### Test for invalid submision
 
* Important to remember:  
  ```HTML
  HTML    ->  CSS
  id=x    ->  #x
  class=x ->  .x
  ```
  [Rest of CSS selectors](https://www.w3schools.com/cssref/css_selectors.asp)

* ex1 - Write a test for the error messages implemented inListing 7.20.
  ```ruby
  require "test_helper"

  class UsersSignupTest < ActionDispatch::IntegrationTest
    test "invalid signup information" do
    #
    #
    #
    assert_select 'div#error_explanation'
    assert_select 'div.alert'
    end
  end
  ```

### Successful signups

* ex1 - Using Rails console, verify that a user is in fact created when submitting valid information  
  __Yup, there is another user in DB__
  ```bash
  User.count
  #or
  User.last
  ```

* ex2 - Confirm by updating and submitting a valid user that `redirect_to user_url(@user)` has the same effect as `redirect_to @user`  
  __Yes__
  
### The flash

* ex1 - Value of "#{:success}"
  ```bash
  >> "#{:success}"
  => "success"
  ```
  
* ex2 - How does the previous exercise relate to the flash iteration shown listing?  
  __In listing we put all keys and values corresponding to them (there is only 2), and in ERB we do basically the same__
  
### The first signup

* ex1
  ```bash
  >> User.find_by(email: "example@railstutorial.com")
  => #<User id: 1, name: "Rails Tutorial", email: "example@railstutorial.com", created_at: "2021-03-23 13:42:53.282875000 +0000", updated_at: "2021-03-23 13:42:53.282875000 +0000", password_digest: [FILTERED]>
  ```
  
* ex2 - Create a new user with your primary email address. Verify that the Gravatar correctly appears.
  __Yes, there is a good gravatar__
  
### A test for valid submission

* ex1 - Write a test for the flash implemented in Section 7.4.2. How detailed you want to make your tests is up to you; 
  ```ruby
  test "valid signup information" do
    #
    #
    assert_not flash.empty?
  end
  ```

* ex2 - As noted above, the flash HTML inListing 7.29 is ugly. Verify by running the test suite that the cleaner code
  ```html
      <div class="alert alert-<%#= message_type %> "><%#=message %></div>
      <!-- or -->
      <%= content_tag(:div, message, class: "alert alert-#{message_type}") %>
  ```
  __Both codes works the same way, the second one is beautiful because is like ruby.__

* ex3 - Verify that the test fails if you comment out the redirect line in Listing 7.26.
  ```ruby
  #
  if @user.save
    flash[:success] = "Welcome to my inn"
    #redirect_to user_url(@user)
  else
    #...
  end
  #
  ```
  __Yes, if you comment redirection, the test will fail.__

* ex4 - Suppose we changed @user.save to false in Listing 7.26. How does this change verify that the assert_difference block is testing the right thing?  
  __If Im right we can check that there is no error message instead of checking that there is any message, sth like:__
  ```ruby
  assert_predicate flash[:error], :nil?
  ```

## Professional grade development

### SSL

* ex1 - Confirm on your browser that the SSL lock and https appear.  
  __Currently i cannot do that because im on local server__  
  
* ex2 - Create a user on the production site using your primary email address.Does your Gravatar appear correctly?  
  __Currently i cannot do that because im on local server__  
  
# Chapter 8

[Bootstrap buttons](https://getbootstrap.com/docs/4.0/components/buttons/)  
[Bootstrap form layouts](https://getbootstrap.com/docs/5.0/forms/layout/)

* Important to remember
  To activate the dropdown menu, include Boot-strap’s custom JavaScript library which is not included
  automatically as part of the bootstrap-sass gem.  
  `yarn add jquery@3.4.1 bootstrap@3.4.1`  
  
### Basic login

* ex1 - What is the difference between GET login_path and POST login_path?  
  __GET login_path corresponds to new session, when POST login_path to create a new session__
  
* ex2 - By piping the results of rails routes to grep, list all the routes associated with the Users resource
  ```bash
  >>rails routes | grep users#
  users_new   GET     /users/new(.:format)           users#new
  signup      GET     /signup(.:format)              users#new
  users       GET     /users(.:format)               users#index
              POST    /users(.:format)               users#create
  new_user    GET     /users/new(.:format)           users#new
  edit_user   GET     /users/:id/edit(.:format)      sers#edit
  user        GET     /users/:id(.:format)           users#show
              PATCH   /users/:id(.:format)           users#update
              PUT     /users/:id(.:format)           users#update
              DELETE  /users/:id(.:format)           users#destroy
  ```
  
### Login Form

* ex1 -  Submissions from the form defined in Listing 8.4 will be routed to the Session controller’s create action. How does Rails know to do this?  
  __We know, that form method is post : `<form accept-charset="UTF-8" action="/login" method="post">`.
  Route that corresponds to action login and method post is create : ` post '/login', to: 'sessions#create'`,
  I believe this is enough for Ruby to do the rest (not REST {wink, wink}).__
  
### Finding and authenticating a user
  Methods from:  
  `x.find_by` from `Active Record`  
  `authenticate` from `has_secure_password`  


  Debug after login:
  ```html
  session: !ruby/hash:ActiveSupport::HashWithIndifferentAccess
  email: elemelo@elo.melo
  password: '12345678'
  ```

### Rendering with a flash message
  Running only one test:  
  `rails test test/integration/users_login_test.rb`
  
* ex1 - Verify in your browser that the sequence fromSection 8.1.4 works correctly, i.e., that the flash message disappears when you click on a second page.  
  __Works fine__
  
## Logging in
  Session cookie - temporary, expires after closing browser (also encrypted),  
  Cookie (cookies method) - cookies that dont expire.  

* ex1 - Log in with a valid user and inspect your browser’s cookies. What is the value of the session content?
  ```html
  _sample_app_session:"Q1FA2D%2BXO0sS%2B93P%2BOz8mrZhmA8zEZTGQ1o8ReF7e%2F6ishNCwB9VKmkUKdyw3sAUAM%2BzpJjbPvOSgFO0pn
  4f7RX8xjVVd%2FoI5Q0FIWnXwJDoYBCf5PvHQ5VkCMXAHdQZ1sRmDFQF8%2FSTKwcyQE220NvTWAGCXsffLzK8uxH7NbLgj8Evph8BT5%2Fgb%2
  BC3oN%2FzmGLjgEA4Ar8Djb6xgvgsi5NqXdOsIcoBrX0w%2BG0W0U8udGictHdR4FUvgPKbdyjo1j9Tl5D%2BKZHWH947ASxhYjVBri%2FuWolsgrxh
  --VE2o7himP%2BN4UYv1--psIu2XKfWvtiwPBgHmP0Jg%3D%3D"
  Domain:"localhost"
  Wygasa / Max-Age:"Sesja"
  ```

* ex2 - What is the value of the Expires attribute from the previous exercise?
  ```html
  Wygasa / Max-Age:"Sesja"
  ```
  
### Current user

* ex1 - Confirm at the console that User.find_by(id: ...) returns nil when the corresponding user doesn’t exist
  ```bash
  >> User.find_by(id: 1)
  => #<User id: 1, name: "Rails Tutorial", email: "example@railstutorial.com", created_at: "2021-03-23 13:42:53.282875000 +0000", updated_at: "2021-03-23 13:42:53.282875000 +0000", password_digest: [FILTERED]>
  >> User.find_by(id: 1000)
  => nil
  ```
  
* ex2 - In a Rails console, create a session hash with key :user_id. By following the steps in Listing 8.17, confirm that the ||= operator works as required.
  ```bash
  >> session={}
  >> session[:user_id]=nil
  >> @current_user ||= User.find_by(id: session[:user_id])
  >> @current_user
  => nil
  >> session[:user_id] = User.first.id
  User Load (0.3ms)  SELECT "users".* FROM "users" ORDER BY "users"."id" ASC LIMIT ?  [["LIMIT", 1]]
  >> @current_user ||= User.find_by(id: session[:user_id]) 
  >> @current_user
  => #<User id: 1, name: "Rails Tutorial", email: "example@railstutorial.com", created_at: "2021-03-23 13:42:53.282875000 +0000", updated_at: "2021-03-23 13:42:53.282875000 +0000", password_digest: [FILTERED]>
  >> @current_user ||= User.find_by(id: session[:user_id])
  >> @current_user
  => #<User id: 1, name: "Rails Tutorial", email: "example@railstutorial.com", created_at: "2021-03-23 13:42:53.282875000 +0000", updated_at: "2021-03-23 13:42:53.282875000 +0000", password_digest: [FILTERED]>
  ```
  
### Changing the layout links

* ex1  
  __Done__
  
* ex2  
  __Done__
  
### Testing layout changes

* ASK RADEK  
  ```ruby
  cost=ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST:BCrypt::Engine.cost
  ```
  `cost = warunek ? tak : nie`
  Czy to o to chodzi?  
  
* ex1 - Confirm by commenting out everything after `if user`,  the tests still pass even if we don’t authenticate the 
  user by email and password  
  __After commenting out `&& user.authenticate(params[:session][:password]` the test will pass green, but if we have this 
  snippet of code in session controller the validation wont pass with wrong email__  
  
* ex2 - Use the “safe navigation” operator &.to simplify the boolean test.  
  __Done__  
  `if user&.authenticate(params[:session][:password])`
  
### Login after signup

* Important to remember  
  * Session helper methods are not available in test   
  * Test helper methods can be handled in tests
  
* ex1 - Is the test suite red or green if you comment out the log_in line? 
  __After commenting out an `log_in @user`, in user controller, test will fail (RED).__ 
  
* ex2 - By using your text editor’s ability to comment out code, toggle back and forth between commenting out code. 
  __After toggling back code, tests are GREEN__
  
### Logout

* ex1 - Confirm in a browser that the “Log out” link causes the correct changes in the site layout. What is the correspondence between these changes and the final three steps?  
  __Yup, everything is changing correctly. After log out there is:__ 
  * <ins>login button</ins> which corresponds to `assert_select "a[href=?]", login_path`  
  * <ins>no logout button</ins> which corresponds to `aassert_select "a[href=?]", logout_path, count: 0`  
  * <ins>no user button</ins> which corresponds to `assert_select "a[href=?]", user_path(@user),count: 0 `   
 

* ex2 - By checking the site cookies, confirm that the session is correctly removed after logging out.  
  __Yup, cookies were deleted__

# Chapter 9 
## Advanced login

* Important to remember:  
  * Adding attribute to model:  
    `rails generate migration add_(new_atr)_to_(model) (new_atr)_(data_type)`  
    example:  
    `rails generate migration add_remember_digest_to_users remember_digest:string`  
    
  * Long random string:  
    `SecureRandom` -> module in standard Ruby library,  
    `urlsafe_base64` -> method in this module,  
    ```bash
    >> SecureRandom.urlsafe_base64
    => "brl_446-8bqHv87AQzUj_Q"
    ```
### Remember me

* ex1 - In the console, assign user to the first user in the database, and verify by calling it directly that the remember 
  method works. How do remember_token and remember_digest compare?  
  ```bash
  user=User.first
  user.remember
  >> user.remember_digest
  => "$2a$12$2fL0AfzlKiqzmgDaTk9p3uihhMXGORQR44DYP5LKcvVQ3K/aWKcf6"
  >> user.remember_token
  => "p_vckLzZVmh81TbAHimWNA"
  >> user.remember_token==user.remember_digest
  => false

  ```
  
* ex2 - By running the test suite, verify that the implementations in Listing 9.4 (slightly confusing) and Listing 9.5 (extremely confusing) are correct.  
  __Yes, they are correct__  
  
### Login with remembering  

* ex1 - By finding the cookie in your local browser, verify that a remember token and encrypted user id are present after logging in
  ```bash
  remember_token: "24_fsjRNTmof3liPlf_ZDg"
  user_id: "S7PD2Dg8XfS9rwaJ1KvPaSw1xqBbjyRtn7Nk3%2FMf0ARAtKseLmlMExSBEED9vzyedU7ce6Q7Xc4Szua9snPs--TffgDp4lw8ZRVpmK--4NMfX0%2BuwEg9J9lW5K%2B07g%3D%3D"
  ```
  
* ex2 - At the console, verify directly that the authenticated? method defined in Listing 9.6 works correctly.  
  ```bash
  >> u = User.first
  >> u.authenticated?('no token')
  => false
  >> u.remember
  => true
  >> u.authenticated?(u.remember_token)
  => true
  ```
  

### Forgetting users
 
* ex1 - After logging out, verify that the corresponding cookies have been removed from your browser.
  __Yes, they disappears__
  
### Two subtle bugs

* ex1 - Comment out the fix in Listing 9.16 and then verify that the first subtle bug is present by opening two
  logged in tabs, logging out in one, and then clicking “Log out” link in the other.  
  __Yes, after logging out in one tab, then refresh the second one, user is logged out.__  
  
* ex2 - Comment out the fix in Listing 9.19 and verify that the second subtle bug is present by logging out in one 
  browser and closing and opening the second browser.
  __When user log out in one browser, session persist in second one.__
  
* ex3 - Uncomment the fixes and confirm that the test suite goes from red to green.
  ```bash
  rails t
  Finished in 8.16301s
  26 tests, 81 assertions, 0 failures, 0 errors, 0 skips
  ```
  
## Remember Me Checkbox

* ex1 - By inspecting your browser’s cookies directly, verify that the “remember me” checkbox is having its intended effect.  
  __Yes, after checking 'Remember me', cookies 'remember_token' and 'user_id' appears in browser.__
  
* ex2 - At the console, invent examples showing both possible behaviors of the ternary operator.
  ```bash
  >> User.name == 'tester' ? 'yes' : 'no'
  => "no"
  >> User.name != 'tester' ? 'yes' : 'no'
  => "yes"
  ```
  
## Remember Me Tests

* ex1 - As mentioned above, the application currently doesn’t have any way to access the virtual remember_token attribute 
  in the integration test in Listing 9.25. It is possible, though, using a special test method called assigns. Inside a test, 
  you can access instance variables defined in the controller by using assigns with the corresponding symbol. For example, 
  if the create action defines an @user variable, we can access it in the test using assigns(:user). Right now, the Sessions 
  controller create action defines a normal (non-instance) variable called user, but if we change it to an instance variable we 
  can test that cookies correctly contains the user’s remember token. By filling in the missing elements in Listing 9.27 and 
  Listing 9.28 (indicated with question marks ? and FILL_IN), complete this improved test of the “remember me” checkbox.  
  __Done, added instance variable `@user` instead of `user` in session_helper, then changed `#assert_not_empty cookies[:remember_token]` to
  `assert_equal cookies["remember_token"], assigns(:user).remember_token`__  
  
### Testing the remember branch

* ex1 - Verify by removing the authenticated? expression inListing 9.33 that the second test inListing 9.31fails, thereby 
  confirming that it tests the right thing.  
  ```rb
   def current_user
    #...
      if user #&& user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    #...
  end
  ```
  ```bash
  >> rails t
  FAIL["test_current_user_returns_nil_when_remember_digest_is_wrong", #<Minitest::Reporters::Suite:0x00005621696fc558 
  # @name="SessionsHelperTest">, 0.5390161879995503]  test_current_user_returns_nil_when_remember_digest_is_wrong#SessionsHelperTest 
  # (0.54s)  Expected #<User id: 225555153, name: "testertestow", email: "tester@tester.omg", created_at: "2021-04-01 
  # 16:09:26.292578000 +0000", updated_at: "2021-04-01 16:09:26.539040000 +0000", password_digest: [FILTERED], remember_digest: 
  # "$2a$04$QkmefsMtwDM/PTgURQchQ.QKWSrJoKJSADP6Boo3BAs..."> to be nil.
  ```
  __The second test testing right thing.__  


# Chapter 10
## Updating, showing, and deleting users
* Google it:   
  rel="noopener"

### Updating users

* ex1 - As noted above, there’s a minor security issue associated with using target="_blank"to open URLs,
  which is that the target site gains control of what’s known as the “window object” associated with the HTML 
  document. The result is that the target site could potentially introduce malicious content, 
  such as a phishing page. This is extremely unlikely to happen when linking to a reputable site like Gravatar,
  but it turns out that we can eliminate the risk entirely by setting the rel attribute (“relationship”) to"noopener"in the 
  origin link. Add this attribute to the Gravatar edit link in Listing 10.2.  
  __`<a href="https://gravatar.com/emails" targer="_blank" class="change_gravatar" rel="noopener">Change</a>`__
  
* ex2 - Remove the duplicated form code by refactoring the new.html.erb and edit.html.erb views to use the 
  partial in Listing 10.5, as shown in Listing 10.6 and Listing 10.7. Note the use of the provide method,
  10.1. UPDATING USERS549 which we used before in Section 3.4.3 to eliminate duplication in the layout.  
  __Done__
  
### Unsuccessful Edits

* ex1 - Confirm by submitting various invalid combinations of username, email, and password that the edit form won’t accept invalid submissions.  
  __Yes, they doesnt allow to change data to invalid__
  
### Testing unsuccessful edits

