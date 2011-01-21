gem 'capybara', '0.4.0', :group => :test
gem 'cucumber', '0.9.3', :group => :test
gem 'cucumber-rails', :group => :test
gem 'gherkin', '2.2.9', :group => :test
gem 'launchy', :group => :test

post_bundler_strategies <<  lambda do
  generate 'cucumber:install --rspec --capybara --skip-database'

  gsub_file 'features/support/env.rb',
  "require 'cucumber/rails/capybara_javascript_emulation' # Lets you click links with onclick javascript handlers without using @culerity or @javascript", ''

  inject_into_file "features/support/env.rb",
    "\nCapybara.save_and_open_page_path = 'tmp/capybara/'",
    :after => 'Capybara.default_selector = :css'

  inject_into_file "features/support/env.rb", load_snippet('factory_girl', 'cucumber'), :after => 'ActionController::Base.allow_rescue = false'

  # Mongoid truncation strategy
  create_file 'features/support/hooks.rb', load_template('features/support/hooks.rb', 'mongoid')

  # Compliment to factory_girl step definitions
  create_file 'features/step_definitions/mongoid_steps.rb', load_template('features/step_definitions/mongoid_steps.rb', 'mongoid')
end
