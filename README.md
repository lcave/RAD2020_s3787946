# README

News+ Assigment app for RMIT RAD 2020

Highest level attempted: HD

Team members:

- Luca Cave: s3787946   ~29hrs*

*   Breakdown:

Development - 19 hrs
Reading - 5 hrs 
Testing - 5 hrs


Due to the overlap between Michael Hartl's tutorial and some areas of the assignment, an additional 10hrs 
should be added to the total to include the work done for that tutorial which was easily reused for this 
assignment. 

NOTES:
- The faker gem was used to generate seed data
- The trix gem was used for rich text editing. This functionality is included in rails 6 so I felt it was 
  ok to use the gem here. This could also be done by manually adding the trix javascript and css files to 
  the project and using the relevant html tags.
- Despite trying the fixes posted on the discussion board, I was unable to get sendgrid to work with my Heroku
  account. The password resets test demonstrates that password reset functionality is included and works as 
  intended. 


https://still-ridge-50837.herokuapp.com/



Latest log:

-----> Ruby app detected
-----> Installing bundler 2.0.2
-----> Removing BUNDLED WITH version in the Gemfile.lock
-----> Compiling Ruby/Rails
-----> Using Ruby version: ruby-2.6.6
-----> Installing dependencies using bundler 2.0.2
       Running: bundle install --without development:test --path vendor/bundle --binstubs vendor/bundle/bin -j4 --deployment
       The dependency tzinfo-data (>= 0) will be unused by any of the platforms Bundler is installing for. Bundler is installing for ruby but the dependency is only for x86-mingw32, x86-mswin32, x64-mingw32, java. To add those platforms to the bundle, run `bundle lock --add-platform x86-mingw32 x86-mswin32 x64-mingw32 java`.
       Using rake 13.0.1
       Using concurrent-ruby 1.1.6
       Using i18n 1.8.2
       Using minitest 5.14.1
       Using thread_safe 0.3.6
       Using tzinfo 1.2.7
       Using activesupport 5.1.7
       Using builder 3.2.4
       Using erubi 1.9.0
       Using mini_portile2 2.4.0
       Using nokogiri 1.10.9
       Using rails-dom-testing 2.0.3
       Using crass 1.0.6
       Using loofah 2.5.0
       Using rails-html-sanitizer 1.3.0
       Using actionview 5.1.7
       Using rack 2.2.2
       Using rack-test 1.1.0
       Using actionpack 5.1.7
       Using nio4r 2.5.2
       Using websocket-extensions 0.1.4
       Using websocket-driver 0.6.5
       Using actioncable 5.1.7
       Using globalid 0.4.2
       Using activejob 5.1.7
       Using mini_mime 1.0.2
       Using mail 2.7.1
       Using actionmailer 5.1.7
       Using activemodel 5.1.7
       Using arel 8.0.0
       Using activerecord 5.1.7
       Using public_suffix 4.0.5
       Using addressable 2.7.0
       Using execjs 2.7.0
       Using autoprefixer-rails 9.7.6
       Using bcrypt 3.1.12
       Using rb-fsevent 0.10.4
       Using ffi 1.12.2
       Using rb-inotify 0.10.1
       Using sass-listen 4.0.0
       Using sass 3.7.4
       Using bootstrap-sass 3.3.7
       Using will_paginate 3.3.0
       Using bootstrap-will_paginate 1.0.0
       Using bundler 2.0.2
       Using mini_magick 4.10.1
       Using ruby-vips 2.0.17
       Using image_processing 1.11.0
       Using mimemagic 0.3.5
       Using carrierwave 2.1.0
       Using coffee-script-source 1.12.2
       Using coffee-script 2.4.1
       Using method_source 1.0.0
       Using thor 1.0.1
       Using railties 5.1.7
       Using coffee-rails 4.2.2
       Using faker 2.11.0
       Using font-awesome-rails 4.7.0.5
       Using jbuilder 2.10.0
       Using jquery-rails 4.4.0
       Using pg 1.2.3
       Using puma 3.12.6
       Using sprockets 3.7.2
       Using sprockets-rails 3.2.1
       Using rails 5.1.7
       Using tilt 2.0.10
       Using sass-rails 5.0.7
       Using trix 0.11.1
       Using turbolinks-source 5.2.0
       Using turbolinks 5.2.1
       Using uglifier 4.2.0
       Bundle complete! 30 Gemfile dependencies, 71 gems now installed.
       Gems in the groups development and test were not installed.
       Bundled gems are installed into `./vendor/bundle`
       Bundle completed (0.51s)
       Cleaning up the bundler cache.
-----> Installing node-v10.15.3-linux-x64
-----> Detecting rake tasks
-----> Preparing app for Rails asset pipeline
       Running: rake assets:precompile
       Yarn executable was not detected in the system.
       Download Yarn at https://yarnpkg.com/en/docs/install
       Asset precompilation completed (2.78s)
       Cleaning assets
       Running: rake assets:clean
-----> Detecting rails configuration
###### WARNING:
       You have not declared a Ruby version in your Gemfile.
       To set your Ruby version add this line to your Gemfile:
       ruby '2.6.6'
       # See https://devcenter.heroku.com/articles/ruby-versions for more information.
-----> Discovering process types
       Procfile declares types     -> web
       Default types for buildpack -> console, rake
-----> Compressing...
       Done: 44M
-----> Launching...
       Released v52
       https://still-ridge-50837.herokuapp.com/ deployed to Heroku