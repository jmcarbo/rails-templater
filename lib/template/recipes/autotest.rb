gem 'autotest','4.4.5',:group=>:test
gem 'autotest-rails',:group=>:test
gem 'autotest-growl',:group=>:test
gem 'autotest-fsevent',:group=>:test

post_bundler_strategies <<  lambda do

  # .autotest
  create_file '.autotest', load_template('autotest', 'autotest')

end

