class MembersController < ApplicationController
  def new
    @league = League.find(params[:league_id])
    @member = Member.new
  end

  def create
    @member = Member.new(params[:member].merge(league_id: params[:league_id]))
    respond_to do |format|
      if @member.save
        format.html {redirect_to league_path(params[:league_id]), notice: "Member was successfully added" }
        format.js
      else
        format.html {redirect_to league_path(params[:league_id]), alert: "Unable to create member" }
        format.js
      end
    end
  end
end
