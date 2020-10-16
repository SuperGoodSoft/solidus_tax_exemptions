# frozen_string_literal: true

require 'solidus_core'
require 'solidus_support'

require 'solidus_tax_exemptions/configuration'
require 'solidus_tax_exemptions/version'
require 'solidus_tax_exemptions/engine'
require 'solidus_tax_exemptions/tax_calculator'

module SolidusTaxExemptions
  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield configuration
    end
  end
end
