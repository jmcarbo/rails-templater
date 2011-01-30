if template_options[:devise]
  gem 'devise'

  post_bundler_strategies << lambda do
    generate 'devise:install'
  end
end
