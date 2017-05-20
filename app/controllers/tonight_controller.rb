class TonightController < ApplicationController
  def index
  	@requests = Request.all
  end
end
