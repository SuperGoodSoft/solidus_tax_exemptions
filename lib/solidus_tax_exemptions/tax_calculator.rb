module SolidusTaxExemptions
  class TaxCalculator
    def initialize(order)
      @order = order
    end

    def calculate
      if exempt_order_check.call(order)
        Spree::Tax::OrderTax.new(
          order_id: order.id,
          line_item_taxes: [],
          shipment_taxes: []
        )
      else
        default_tax_calculator.new(order).calculate
      end
    end

    private

    attr_reader :order

    def exempt_order_check
      SolidusTaxExemptions.configuration.exempt_order_check.new
    end

    def default_tax_calculator
      SolidusTaxExemptions.configuration.default_tax_calculator
    end
  end
end
