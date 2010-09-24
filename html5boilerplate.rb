# Rails 3 simple template
#  USE ONLY ON EMPTY APPS - USAGE:rails new app_name -m rails3-templates/base.rb 

# Remove Default
run 'mv public/index.html public/test-rails3.html'

# Install JQuery
inside "public/javascripts" do
  FileUtils.rm_rf %w(controls.js dragdrop.js effects.js prototype.js rails.js)
  get "http://github.com/rails/jquery-ujs/raw/master/src/rails.js", "rails.js"
end

# Install HTML5-Boilerplate

inside "public" do
  run "git clone http://github.com/paulirish/html5-boilerplate.git"

  run 'cp html5-boilerplate/* . -R'
  run 'mv js/* javascripts/'
  run 'mv css/* stylesheets/'
  run 'rm -Rf js css html5-boilerplate'
  run 'mv index.html example-html5b.html'
  inside "javascripts" do
    run "mv jquery-* jquery.js"
    run "mv modernizr-* modernizr.js"  
  end
  
end

run 'rm app/views/layouts/application.html.erb'

# Layout
file 'app/views/layouts/application.html.erb', <<-FILE
<!doctype html>  
<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ --> 
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<head>
  <meta charset="utf-8">

  <!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame 
       Remove this if you use the .htaccess -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

  <title></title>
  <meta name="description" content="">
  <meta name="author" content="">

  <!--  Mobile viewport optimized: j.mp/bplateviewport -->
  <meta name="viewport" content="width=device-width; initial-scale=1.0">

  <!-- Replace favicon.ico & apple-touch-icon.png in the root of your domain and delete these references -->
  <link rel="shortcut icon" href="/favicon.ico">
  <link rel="apple-touch-icon" href="/apple-touch-icon.png">

  <%= stylesheet_link_tag :all %>
  <%= javascript_include_tag 'jquery', 'rails', 'modernizr' %>
  <%= csrf_meta_tag %>

</head>

<body>

  <div id="container">
    <header>

    </header>
    
    <div id="main">
<%= yield %>
    </div>
    
    <footer>

    </footer>
  </div>
  <!-- end of #container -->


  <!-- Javascript at the bottom for fast page loading -->

  <script src="/javascripts/plugins.js?v=1"></script>
  <script src="/javascripts/script.js?v=1"></script>

  <!--[if lt IE 7 ]>
    <script src="/javascripts/dd_belatedpng.js?"></script>
    <script>
      DD_belatedPNG.fix('img, .png_bg'); //fix any <img> or .png_bg background-images
    </script>
  <![endif]-->

<% if Rails.env == 'development' %>
  <!-- yui profiler and profileviewer - remove for production -->
  <script src="/javascripts/profiling/yahoo-profiling.min.js"></script>
  <script src="/javascripts/profiling/config.js?v=1"></script>
  <!-- end profiling code -->
<% end %>

<% if Rails.env == 'production' %>
  <!-- asynchronous google analytics: mathiasbynens.be/notes/async-analytics-snippet 
       change the UA-XXXXX-X to be your site's ID -->
  <script>
   var _gaq = [['_setAccount', 'UA-XXXXX-X'], ['_trackPageview']];
   (function(d, t) {
    var g = d.createElement(t),
        s = d.getElementsByTagName(t)[0];
    g.async = true;
    g.src = ('https:' == location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    s.parentNode.insertBefore(g, s);
   })(document, 'script');
  </script>
<% end %>

</body>
</html>
FILE
