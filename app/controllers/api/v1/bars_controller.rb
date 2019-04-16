class Api::V1::BarsController < ApplicationController

  def index
    @bars = Bar.all
    render json: @bars
  end

  def create
    @bar = Bar.create(bar_params)
    render json: @bar
  end

  def update
    @bar.update(bar_params)
  end

  def destroy
    @bar.destroy
  end

# Private helper methods
  private

  def bar_params
    params.require(:bar).permit(:name, :latitude, :longitude, :event_id, :event_order)
  end

end
