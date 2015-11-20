require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params['guess']
  message = check_guess(guess)
  background_color = check_background_color(message)
  erb :index, :locals => { :message => message, :background_color => background_color }
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

  def check_background_color(message)
    if message.empty?
      "white"
    elsif message.split.include?("Way")
      "#FF3036"
    elsif message.split.include?("right!")
      "#56ce56"
    else
      "#ff9090"

  end

end
