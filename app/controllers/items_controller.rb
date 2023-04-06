class ItemsController < ApplicationController
  def index 
    @rails_engine = RailsEngineFacade.new(params)
  end

  def show
    @rails_engine = RailsEngineFacade.new(params)
  end
end
