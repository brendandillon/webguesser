require 'sinatra'
require 'sinatra/reloader'

class RandomNumber
  attr_reader :number

  def generate
    @number = rand(101)
  end

end

rn = RandomNumber.new
rn.generate

get '/' do 
  "THE SECRET NUMBER IS #{rn.number}"
end
