class MembersController < ApplicationController
  def new
    @league = League.find(params[:league_id])
    @member = Member.new
  end

  def create
    @member = Member.new(params[:member].merge(league_id: params[:league_id]))
    if @member.save
      redirect_to league_path(params[:league_id]), notice: "Member was successfully added"
    else
      redirect_to league_path(params[:league_id]), alert: "Unable to create member"
    end
  end
end
