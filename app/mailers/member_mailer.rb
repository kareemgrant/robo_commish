class MemberMailer < ActionMailer::Base
  default from: "kareem.grant@gmail.com"

  def intro_email(members)
    @members = members

    mail to: Proc.new { @members.pluck(:email) }, subject: "Cru Luv 2013 Payout/Fees"
  end
end
