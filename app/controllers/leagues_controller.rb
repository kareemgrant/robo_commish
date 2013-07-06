class LeaguesController < ApplicationController

  def index
    @leagues = League.all
  end

  def new
    @league = League.new
  end

  def show
    @league = League.find(params[:id])
  end

  def create
    @league = League.new(params[:league])

    if @league.save
      redirect_to @league, notice: "League was successfully created"
    else
      flash.now[:error] = "League could not be saved"
      render :new
    end
  end

end
