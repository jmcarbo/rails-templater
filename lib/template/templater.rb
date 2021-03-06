require File.join(File.dirname(__FILE__), 'core_extensions.rb')

initialize_templater

required_recipes = %w(autotest default devise jquery haml rspec factory_girl remarkable)

say("\nInitial generation complete\n", Thor::Shell::Color::YELLOW)

load_options
apply(recipe('mongoid')) if @template_options[:mongoid]
required_recipes.each {|required_recipe| apply recipe(required_recipe)}
apply(recipe('cucumber')) if yes?("\nWould you like to add integration testing with Cucumber? [y|n]: ", Thor::Shell::Color::BLUE)
apply recipe('design')

run 'bundle install'

execute_post_bundler_strategies

environment load_snippet('generators', 'rails')

git :add => "."
git :commit => "-m 'Initial commit'"
