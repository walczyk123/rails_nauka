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











