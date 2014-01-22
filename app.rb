require 'sinatra/base'
require 'sinatra/assetpack'
require 'sass'
require 'bootstrap-sass'


class App < Sinatra::Base
  path = File.expand_path(File.dirname(__FILE__))
  set :root, '/'
  set :views, "#{path}/views"
  register Sinatra::AssetPack
	assets do
   serve '/css', from: "#{path}/css"
   serve '/bootstrapjs', from: "#{Bootstrap.javascripts_path}/bootstrap"

    css :main, [
     '/css/*.css'
    ]
    js :main, [
    '/bootstrapjs/*.js'
    ]
    css_compression :sass
  end

  get '/?' do
    erb :index
  end
end

if __FILE__ == $0
  App.run!
end