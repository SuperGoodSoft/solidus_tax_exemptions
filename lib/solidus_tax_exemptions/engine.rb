# frozen_string_literal: true

require 'spree/core'
require 'solidus_tax_exemptions'

module SolidusTaxExemptions
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions

    isolate_namespace ::Spree

    engine_name 'solidus_tax_exemptions'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
