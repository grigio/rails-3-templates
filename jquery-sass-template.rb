# Rails 3 simple template
#  USE ONLY ON EMPTY APPS - USAGE:rails new app_name -m rails3-templates/base.rb 

JQUERY_VERSION = '1.4.4'

# Remove Default
run 'mv public/index.html public/test-rails3.html'

# JQuery
say_status("+ JQuery version #{JQUERY_VERSION}", :green)
inside "public/javascripts" do
  %w(controls.js dragdrop.js effects.js prototype.js rails.js).each do |file|
    remove_file file
  end
  get "https://github.com/rails/jquery-ujs/raw/master/src/rails.js", "rails.js"
  get "http://ajax.googleapis.com/ajax/libs/jquery/#{JQUERY_VERSION}/jquery.min.js", "jquery.js"
end

application do
  'config.action_view.javascript_expansions[:defaults] = %w(jquery rails)'
end
#inject_into_class "config/application.rb", "Application" do <<FILE
#  config.action_view.javascript_expansions[:defaults] = %w(jquery rails)
#FILE
#end



# nifty generators
remove_file 'app/views/layouts/application.html.erb'
gem "nifty-generators", :group => :development
gem "mocha"

generate "nifty:layout"

# SASS/SCSS
gem "sass"
run "mkdir public/stylesheets/sass"
prepend_to_file 'config/environments/test.rb' do <<-FILE
  require 'sass/plugin/rack'
  use Sass::Plugin::Rack
FILE
end

# RSpec
#say_status("+ RSpec", :green)
#gem "rspec-rails", "~> 2.4"

#generate "rspec:install"
#inject_into_file('config/application.rb', :after => "config.i18n.default_locale = :de") do
#  %q{
#    
#    # Generator Settings
#    config.generators do |g|
#      g.test_framework :rspec, :fixture => false, :views => false
#    end
#  }
#end

# Default template
say_status("+ Default Layout", :green)

# Default controller
say_status("+ Default Controller", :green)


run "bundle install"

