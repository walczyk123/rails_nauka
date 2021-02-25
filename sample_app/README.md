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











