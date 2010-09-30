# Rails 3 simple template
#  USE ONLY ON EMPTY APPS - USAGE:rails new app_name -m rails3-templates/base.rb 

# Remove Default
run 'mv public/index.html public/test-rails3.html'

# Install JQuery
inside "public/javascripts" do
  %w(controls.js dragdrop.js effects.js prototype.js rails.js).each do |file|
    remove_file file
  end
  get "http://github.com/rails/jquery-ujs/raw/master/src/rails.js", "rails.js"
end

inject_into_class "config/application.rb", "Application" do <<FILE
config.action_view.javascript_expansions[:defaults] = %w(jquery rails)
FILE



end
