# README

## Sample_app

# Chapter 3  

### common commands  

* rails db:migrate  

* rails test  

* rails server  


## Controller excercises  

* rails generate controller Foo bar baz  

* rails destroy controller Foo bar baz  

## New dynamic page excercise  

* Added Contact page successfully

## Changing root page  

* Changed root, done testing, works fine

## Issues
assert_select: command not found -> problem solved

# Chapter 4  

## Notebook  

* "" suports interpolation in strings, when '' dont  

## String excercises  

* city = "krakow"  
state = "malopolska"  

* "#{city}, #{state}"  ->  "krakow, malopolska"

* "#{city}, #{state}"    (no diffrence between them)

* '#{city}, #{state}'   ->  "\#{city}, \#{state}"

## Objects and message passing excercises  

* "racecar".length -> 7    

* !!"racecar".reverse -> "true"  

* s = "racecar"  
s == s.reverse ? "they are the same" : "kinda diffrent tho"  
-> "they are the same"  

* s = "onomatopeja"  
s == s.reverse ? "they are the same" : "kinda diffrent tho"  
-> "kinda diffrent tho"  

## Method definitions excercises  

* #palindromes testing  
def palindrome_tester(s)  
    if s == s.reverse  
        puts "it's a palindrome!"  
    else
        puts "it's not a palindrome!"  
    end  
end  
->  
>> palindrome_tester("kajak")  
it's a palindrome!  
=> nil  

>> palindrome_tester("kajaki")  
it's not a palindrome!  
=> nil  

* Confirmed by puting "kajak" and "kajaki" in tester  

* palindrome_tester("kajaki").nil?  
it's not a palindrome!  
=> true  

## Other data structures  
### Arrays  

* a = "A man, a plan, a canal, Panama".split(', ')  
a  
=> ["A man", "a plan", "a canal", "Panama"]  

* s = a.join  
s  
=> "A mana plana canalPanama"  

* spl = s.split(' ').join  
spl  
=> "AmanaplanacanalPanama"  
.........................  
palindrome_tester(spl)  
=>it's not a palindrome!  
.........................  
palindrome_tester(spl.downcase)  
=>it's a palindrome!  

* b = ("a".."z").to_a  
.........................  
b[7]  
=> "h"  
.........................  
b[-7]  
=> "t"  

### Blocks  

* (0..16).each do |i|     
    puts "kwadratem liczby #{i} jest #{i**2}"  
  end  
  
  -> works fine, but output is kinda long, so i dont put it here  

* def yaller(arr)  
   upc = arr.map{ |i| i.upcase}  
   puts upc.join  
  end  
.........................  
  -> yaller(['o','l','d'])  
  OLD  
  
* def random_subdomain  
    letters = ('a'..'z').to_a  
    sub_dom = (0..7).map {letters[rand(7)]}  
    puts sub_dom.join  
  end  
.........................  
random_subdomain  
fgbdadcd  
=> nil  

* def string_shuffle(s)  
    s.split('').shuffle.join    
  end  
  string_shuffle("foobar")  
.........................  
string_shuffle("foobar")    
=> "oofrab"  

### Hashes and symbols  

* lang = { one: "uno", two: "dos", tree: "tres" }   
  lang.each do |eng,esp|  
    puts "#{eng} in spanish is #{esp}"  
  end  
.........................  
one in spanish is uno  
two in spanish is dos  
tree in spanish is tres  
=> {:one=>"uno", :two=>"dos", :tree=>"tres"}  

* person = {} 
params = {} 
person[:person1] = { frst: "name1", last: "last1" }  
person[:person2] = { frst: "name2", last: "last2" }  
person[:person3] = { frst: "name3", last: "last3" }  
params[:father] = person[:person1]  
params[:mother] = person[:person2]  
params[:child] = person[:person3]  
params[:father][:frst]  
=> "name1"  

* def random_pswd(lngth)  
    letters = ('a'..'z').to_a  
    pswd = (0..lngth).map {letters[rand(lngth)]}  
    return pswd.join  
  end   
  user = { name: "Kamil", email: "random@random.com", password: random_pswd(15) }  
  puts "#{user[:name]} ,#{user[:email]} ,#{user[:password]}"  
.........................   
Kamil ,random@random.com ,hmbhmnhffbgeiblm  
=> nil  
 
* Returns a new ActionController::Parameters with all keys from other_hash merged into current hash.  
{"a"=>100,"b"=>200}.merge({"b"=>300}) changes "b" in first hash to 300, so output is: "a"=100, "b"=300  
  
### Classes  

#### Constructors  

* (1..10) -> literal constructor, range constructor is just Range(1,10)  

* c = Range.new(1,10)  where 1 is starting point and 10 is end point  

* (1..10) -> literal constructor , Range.new(1,10) -> named constructor  
(1..10) == Range.new(1,10)  
=> true  

#### Inheritance  

* Inheritance hierarchy for:  
- Range - Object - Basic Object  
- Hash - Object - Basic Object  
- Symbol - object - Basic Object  

* class Word < String  
    def palindrome?  
      self == reverse  
    end  
  end  
  
  s = Word.new("level")  
  s.palindrome?  
  >  
  
  => true  
  
#### Modyfing built-in classes  

* class String  
    def palindrome?  
      self == self.reverse  
    end  
  end  
  "racecar".palindrome?  
  => true  
  "onomatopeia".palindrome?  
  => false  
  "Malayalam".downcase.palindrome?  
  => true  
  
* class String  
    def shuffle  
      self.split('').shuffle.join    
    end  
  end  
  "majo".shuffle
  => "amjo"

* class String  
    def shuffle  
      split('').shuffle.join    
    end  
  end  
"majo".shuffle  
=> "oajm"  

#### Controller Class

* user = User.new  
  user.class  
  => User(id: integer, name: string, email: string, created_at: datetime, updated_at: datetime)  
  
* hierarchy  
  user - ApplicationRecord - ActiveRecord::Base - Object  
  
#### User Class  

* class User  
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
  user = User.new(first: "Kamil", last: "Wlcz", email: "rand@rand.com")  
  user.formated_email  
  => "Kamil Wlcz <rand@rand.com> "  

* class User  
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
  user = User.new(first: "Kamil", last: "Wlcz", email: "rand@rand.com")  
  user.alph_name      
  => "Kamil_Wlcz"  

* class User  
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
  user = User.new(first: "Kamil", last: "Wlcz", email: "rand@rand.com")  
  user.alph_name.full_name

### End of chapter 4  






