gem 'mongoid', '2.0.0.rc.6'
gem 'bson_ext', '~> 1.2'

post_bundler_strategies << lambda do
  generate 'mongoid:config'
  run 'cp config/mongoid.yml config/mongoid.yml.example'
end
