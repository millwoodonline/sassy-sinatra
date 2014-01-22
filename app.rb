require 'sinatra/base'
require 'sinatra/assetpack'
require 'sass'
require 'bootstrap-sass'


class App < Sinatra::Base
  set :root, '/'
  set :views, "#{File.expand_path(File.dirname(__FILE__))}/views"
  register Sinatra::AssetPack
	assets do
   serve '/css', from: "#{File.expand_path(File.dirname(__FILE__))}/css"
   serve '/bootstrapjs', from: "#{Bootstrap.javascripts_path}/bootstrap"
   serve '/', from: "#{File.expand_path(File.dirname(__FILE__))}/js"

    css :main, [
     '/css/*.css'
    ]
    js :main, [
    '/*.js',
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