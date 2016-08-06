require 'sinatra'

class RandomNumber
  attr_reader :number

  def generate
    @number = rand(101)
  end

end

rn = RandomNumber.new
rn.generate

get '/' do 
  "The secret number is #{rn.number}"
end
