require "spec_helper"

RSpec.describe SolidusTaxExemptions::TaxCalculator do
  describe "#calculate" do
    subject { described_class.new(order).calculate }

    let(:order) { instance_double Spree::Order, id: 123, number: number }

    before do
      described_class.exempt_order_check = -> (order) { order.number == "EXEMPT" }
      described_class.default_tax_calculator = "Spree::TaxCalculator::Default"
    end

    context "when the order is exempt" do
      let(:number) { "EXEMPT" }

      it "returns no tax" do
        expect(subject.order_id).to eq 123
        expect(subject.line_item_taxes).to be_empty
        expect(subject.shipment_taxes).to be_empty
      end
    end

    context "when the order is not exempt" do
      let(:number) { "NOT_EXEMPT" }

      it "falls back to the default tax calculator" do
        allow_any_instance_of(Spree::TaxCalculator::Default).to receive(:calculate).and_return(:some_taxes)
        expect(subject).to eq :some_taxes
      end
    end
  end
end
