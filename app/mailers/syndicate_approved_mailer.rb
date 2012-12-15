class SyndicateApprovedMailer < ActionMailer::Base
  default from: "syndicate152@gmail.com"

  def syndicate_approved_email(syndicate)
      @syndicate = syndicate.syndicate_name
      #@user = user.email
      mail(:to => "doug.a.armstrong@gmail.com", :subject => "Your Syndicate Has Been Approved")
      #mail(:to => user.email, :subject => "Your Syndicate Has Been Approved")
    end
end


