# Tech Challenge

This is a software for a tech challenge.

### Below are 3 classes used for making a car rental program 
    -   Improve and simplify the code but don't change the output. We're looking for demonstrated knowledge of Ruby idioms, general good coding practices, and testing
    -   Add a new method (json_statement) to Driver which gives you back the statement in JSON format
    -   Create a rake task that runs your tests.

My approach was to break the single-file script into a multiple file project. But I'm also uploading a version of the project in a single-file.

# Requirements
This software and it's tests are fully tested to run in ruby version 2.6.3p62 but you shouldn't have any problem with versions higher than 2.5.0

# Installation Instruction
Clone this repository into any folder and run bundle install.


# Running the project

To run this project, you can use the command 

```
$ rake irb
```

or 

```
$ irb -I . -r ./main.rb
```

That will open an interactive console with the libs loaded

# Running the tests 

This project uses the rspec tests framework. You can run the tests using the command 

```
$ rspec
```

or the rake task 

```
$ rake test
```

