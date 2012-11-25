class ApproveSyndicate < ActionMailer::Base
  default :from =>  :"syndicate152@gmail.com"

  def new_syndicate_email(syndicate)
    @syndicate = syndicate.syndicate_name

    mail(:to => "doug.a.armstrong@gmail.com", :subject => "New Syndicate Approval Required")
  end
end
