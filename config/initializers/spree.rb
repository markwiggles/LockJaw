# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  # Example:
  # Uncomment to stop tracking inventory levels in the application
  # config.track_inventory_levels = false
  config.allow_ssl_in_production = false


end

Spree.user_class = 'Spree::LegacyUser'


# config = Rails.application.config
# config.spree.calculators.shipping_methods << Spree::Calculator::Shipping::CustomCalculator

# Spree.config = Rails.application.config
# Spree.config.spree.calculators.tax_rates << CustomCalculator
# Spree.config.spree.calculators.shipping_methods << CustomCalculator
# Spree.config.spree.calculators.promotion_actions_create_adjustments << CustomCalculator


module LockJaw
  class Application < Rails::Application

    # Add a new calculator for custom shipping or tax options
    initializer 'spree.register.calculators' do |app|
      app.config.spree.calculators.shipping_methods << Spree::Calculator::Shipping::CustomCalculator
      # app.config.spree.calculators.tax_rates << Spree::Calculator::CustomTaxCalculator
    end

  end

end










