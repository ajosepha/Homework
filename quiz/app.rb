require 'rubygems'
require 'bundler'
Bundler.require

module Quiz
  class Quiz < Sinatra::Application

    
    get '/' do
      "test"
      @food=["I'm technically not alive, so I don't need food", "worms", "anything but eggs!", "a fat baby"]
      @home=["an enchanted castle", "a chicken coop", "underground", "the forest"]
      @fear=["rotting", "being eaten", "life", "being full"]
      @wishes=["having a head that won't rot", "not being food", "getting back my gems", "to eat a fat baby"]
      @
      erb :test   
    end

    post '/results' do

      # if params.include?("rotting")
      #   @character = "Jack Pumpkin Head"
      # end
      @a = params.values
      if @a.include?("rotting") && @a.include?("I'm technically not alive, so I don't need food") || @a.includes("an enchanted castle")
        @character = "Jack Pumpkin Head"
      elsif @a.include?("being eaten") && @a.include?("a chicken coop") || @a.include?("worms")
        @character = "Bellina the chicken"
      elsif @a.include?("life")
      end

      erb :results

    end


  end
end