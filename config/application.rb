require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Zips
    class Application < Rails::Application
        # bootstraps mongoid within applications -- like rails console
        Mongoid.load!('./config/mongoid.yml')

        # which default ORM are we using with scaffold
        # add --orm none, mongoid, or active_record
        # to rails generate cmd line to be specific
        config.generators { |g| g.orm :active_record }
        # config.generators {|g| g.orm :mongoid}

        # Do not swallow errors in after_commit/after_rollback callbacks.
        config.active_record.raise_in_transactional_callbacks = true
    end
end
