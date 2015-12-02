module Eqn
  if defined? Rails
    # :nocov:
    class Engine < ::Rails::Engine
      initializer 'eqn' do
        config.autoload_paths += Dir["#{config.root}/lib/**/"]
      end
    end
    # :nocov:
  end
end
