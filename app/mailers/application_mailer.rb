# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'app95514897@heroku.com'
  layout 'mailer'
end
