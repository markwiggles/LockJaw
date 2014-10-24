class CustomCalculator < Spree::ShippingCalculator

  def self.description
    "Custom FlexiRate"
  end

  def compute(line_items)
    13.00
  end

end