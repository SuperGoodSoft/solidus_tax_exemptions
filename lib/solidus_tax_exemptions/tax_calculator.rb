module SolidusTaxExemptions
  class TaxCalculator
    cattr_accessor :exempt_order_check, :default_tax_calculator

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
        default_tax_calculator.constantize.new(order).calculate
      end
    end

    private

    attr_reader :order
  end
end
