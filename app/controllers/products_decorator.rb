Spree::ProductsController.class_eval do
  before_filter :load_data, :only => :some_action

  def some_action

    logger.debug 'TESTTSTSTSTSTST'

  end


end