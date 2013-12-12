require 'rubygems'
require 'bundler'
require "sinatra/reloader"

Bundler.require

Dir.glob('./lib/*.rb') do |model|
  require model
end

module Citibike
	class App < Sinatra::Application
    configure :development do
      register Sinatra::Reloader
    end

    before do
      json = File.open("data/citibikenyc.json").read
      @data = MultiJson.load(json)
         @data.each do |c|
          c["lng"] = c["lng"] / 1000000.to_f
          c["lat"] = c["lat"] / 1000000.to_f
        end
    end

    get '/' do
      erb :home
    end

   get '/form' do
     erb :form
    end

  post '/map' do
    @end_loc = params["end"]
    @start_loc = params["start"]
      @s_lng = ""
      @s_lat = ""
      @e_lng = ""
      @e_lat = ""
        @data.each do |c|
          if c["name"] == @start_loc
            @s_lat = c["lat"]
            @s_lng = c["lng"]
          elsif c["name"] == @end_loc
            @e_lat = c["lat"]
            @e_lng = c["lng"]
          end
      end
  end

  get '/map' do
    erb :map
  end



  end
end