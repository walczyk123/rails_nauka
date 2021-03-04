![](https://jaki-jezyk-programowania.pl/img/technologies/rubyonrails.png)

# Learning Ruby on Rails

In this repository I've gather some useful programs, tutorials and websites, that will help me to learn Ruby on Rails programming.  
Ruby on Rails ( just “Rails”) is a free and open-source web devel-opment framework written in theRubyprogramming language.  

[Yarn](https://yarnpkg.com/ "Yarn - package manager")  

# Rails and Yarn instalation

Ruby gem instalation:
``` bash  
gem install rails -v6.0.2.1  
```
Checking version of rails:
``` bash
>rails -v   
```
Instalation of NVM - Node Version Manager:
``` bash  
>wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash  
```
Nodejs instalation:   
``` bash
>sudo apt install nodejs    
```
NPM instalation:
``` bash
>sudo apt install npm    
```
Cmdtest:  
``` bash
>sudo apt install cmdtest  
```
Yarn instalation:   
``` bash
>sudo apt update && sudo apt install yarn  
```
# Binding pry
``` ruby  
before_action do  
    binding.pry  
end  
```
