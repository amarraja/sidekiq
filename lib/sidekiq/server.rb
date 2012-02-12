require 'sinatra/base'
require 'erb'

module Sidekiq
  class Server < Sinatra::Base
    dir = File.dirname(File.expand_path(__FILE__))

    set :views, "#{dir}/server/views"

    if respond_to? :public_folder
      set :public_folder, "#{dir}/server/public"
    else
      set :public, "#{dir}/server/public"
    end

    set :static, true

    helpers do
      include Rack::Utils
    end


    get '/'  do
      @client = Sidekiq::Client
      erb :index 
    end
  end


end