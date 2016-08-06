require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)

get '/' do 
  user_guess = params[:guess].to_i
  message = check_guess(user_guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end

def check_guess(user_guess)
  if user_guess > (SECRET_NUMBER + 5)
    "Way too high!"
  elsif user_guess > SECRET_NUMBER
    "Too high!"
  elsif user_guess < (SECRET_NUMBER - 5)
    "Way too low!"
  elsif user_guess < SECRET_NUMBER
    "Too low!"
  else
    "You got it right!<br>The SECRET NUMBER is #{SECRET_NUMBER}"
  end
end
