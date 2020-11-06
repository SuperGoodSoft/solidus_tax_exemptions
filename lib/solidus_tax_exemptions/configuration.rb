# frozen_string_literal: true

module SolidusTaxExemptions
  class Configuration < Spree::Preferences::Configuration
    class_name_attribute :exempt_order_check,
      default: ""

    class_name_attribute :default_tax_calculator,
      default: "Spree::TaxCalculator::Default"
  end
end
