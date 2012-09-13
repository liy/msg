require 'rubypython'  
RubyPython.configure(:python_exe => 'python2.6') if Rails.env == 'production'  