# frozen_string_literal: true

# Tickets mailer send notificatin when buy or delete ticket.
class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'Вы купили билет')
  end

  def delete_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'Вы удалили билет')
  end
end
