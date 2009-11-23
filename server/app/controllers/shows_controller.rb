class ShowsController < ApplicationController
  before_filter :cache

  def index
    respond_to do |format|
      format.html
      format.js { render :text => MaxFun.scrape.to_json }
    end
  end
  
  def show
    @show = (MaxFun.scrape.select { |s| s[:id].to_s == params[:id].to_s }).first
  end
  
  def new
    send_file RAILS_ROOT + "/public/images/small_icon.png"
  end
end
