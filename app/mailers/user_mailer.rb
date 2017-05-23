class UserMailer < ActionMailer::Base
  default from: "Harry's <welcome@harrys.com>"

  def signup_email(user)
    @user = user
    @twitter_message = "Just became a #VIM. Excited for @SOLDapp_ to launch."

    mail(:to => user.email, :subject => "Thanks for signing up!")
  end
end
