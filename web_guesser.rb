require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params['guess']
  message = check_guess(guess)
  erb :index, :locals => { :message => message }
end

def check_guess(guess)
  if guess.nil?
    message = ""
  elsif guess.to_i > SECRET_NUMBER
    (guess.to_i - SECRET_NUMBER) > 5 ? message = "Way too high!" : message = "Too high!"
  elsif guess.to_i < SECRET_NUMBER
    (SECRET_NUMBER - guess.to_i) > 5 ? message = "Way too low!" : message = "Too low!"
  else
    message = "You got it right! The SECRET NUMBER is #{SECRET_NUMBER}."
  end
end
