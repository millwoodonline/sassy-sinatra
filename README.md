#Sassy Sinatra

[Sass](http://sass-lang.com/) is awesome, but unfortunately [Sinatra](/services/sinatra-ruby-application-development) doesn't come with support out the box. Therefore we can make use of [Sinatra AssetPack](https://github.com/rstacruz/sinatra-assetpack), this will allow the live compiling of Sass as well as formats such as Coffeescript for JavaScript.

    require 'sinatra/base'
    require 'sinatra/assetpack'
    require 'sass'

    class App < Sinatra::Base
      register Sinatra::AssetPack
      assets do
        css :main, [
         '/css/reset.css',
         '/css/*.css'
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

The above example is a pretty standard Sinatra modular application apart from the additions of `register Sinatra::AssetPack` and the `assets` block. Within the assets block we're defining css, calling it "main" and listing an array of css files. Obviously we want the reset to load first so this is explicitly defined, we then add a wildcard for all other files. Sinatra AssetPack file paths are relative to an "app" directory, therefore your Sass files would be in /app/css/style.sass.

Within the `<head>` of your layout.erb file you can add `<%= css :main %>` which will load in the css files. On development this will be as separate uncompressed files, on production they will all be compresses into a single css file. All Sass syntax is converted in css on the fly.

You'll find the full example app on [Github](https://github.com/timmillwood/sassy-sinatra) and also the working copy on [Heroku](http://sassysinatra.herokuapp.com/).
