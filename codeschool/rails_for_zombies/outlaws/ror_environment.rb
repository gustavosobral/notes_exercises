MyApp::Application.configure do
  config.cache_classes = true # Prevents class reloading between requests
  config.eager_load    = true # Loads all code before create new threads
end
