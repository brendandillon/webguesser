require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)

get '/' do 
  user_guess = params[:guess].to_i
  @cheat = params[:cheat]
  check_guess(user_guess)
  erb :index, :locals => {:message => @message, :back_color => @color}
end

def check_guess(user_guess)
  if @cheat == "true"
    @message = "The SECRET NUMBER is #{SECRET_NUMBER}"
  elsif user_guess > (SECRET_NUMBER + 5)
    @message = "Way too high!"
    @color = "f00"
  elsif user_guess > SECRET_NUMBER
    @message = "Too high!"
    @color = "f88"
  elsif user_guess < (SECRET_NUMBER - 5)
    @message = "Way too low!"
    @color = "f00"
  elsif user_guess < SECRET_NUMBER
    @message = "Too low!"
    @color = "f88"
  else
    @message = "You got it right!<br>The SECRET NUMBER is #{SECRET_NUMBER}"
    @color = "0c0"
  end
end
