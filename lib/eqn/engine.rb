module Eqn # :nodoc:
  if defined? Rails
    # Engine to autoload eqn in a Rails environment.
    class Engine < ::Rails::Engine
      initializer 'eqn' do
        config.autoload_paths += Dir["#{config.root}/lib/**/"]
      end
    end
  end
end
