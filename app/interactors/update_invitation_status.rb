# frozen_string_literal: true

class UpdateInvitationStatus
  include Interactor

  delegate :invite, to: :context
  delegate :status, to: :context

  def call
    context.fail!(message: I18n.t('invite.presence.status')) if status.blank?

    if invite.update(status: status)
      context.message = I18n.t('invite.success.update')
    else
      context.fail!(message: invite.errors.full_messages.to_sentence)
    end
  end
end
