require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "account_approved_email" do
    mail = UserMailer.account_approved_email
    assert_equal "Account approved email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
