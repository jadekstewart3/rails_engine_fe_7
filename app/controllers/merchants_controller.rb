class MerchantsController < ApplicationController
  def index
    @rails_engine = RailsEngineFacade.new(params)
  end
  
  def show
    @rails_engine = RailsEngineFacade.new(params)
  end

  def find
    @rails_engine = RailsEngineFacade.new(params)
  end
end