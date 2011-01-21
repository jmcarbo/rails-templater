gem 'devise'

post_bundler_strategies << lambda do
  generate 'devise:install'
end
