class ApplicationMailer < ActionMailer::Base
  include ApplicationHelper

  default :from =>  "cos@gmail.com"
  layout 'mailer'
end
