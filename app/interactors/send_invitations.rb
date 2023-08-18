# frozen_string_literal: true

class SendInvitations
  include Interactor

  delegate :start_date_of_week, to: :context

  def call
    return context.fail!(message: I18n.t('invite.presence.date')) if start_date_of_week.blank?

    calculated_start_date = calculate_start_date
    failed_emp_invitations, already_invited_employees = send_invitations_and_track_results(calculated_start_date)

    return unless failed_emp_invitations.any? || already_invited_employees.any?

    message = build_failure_message(failed_emp_invitations, already_invited_employees)

    context.fail!(message: message)
  end

  private

  def calculate_start_date
    Date.parse(start_date_of_week).beginning_of_week
  end

  def send_invitations_and_track_results(calculated_start_date)
    failed_emp_invitations = []
    already_invited_employees = []

    Employee.find_each do |employee|
      result = send_invitation(employee, calculated_start_date)

      case result
      when :already_invited
        already_invited_employees << employee.name
      when :failed
        failed_emp_invitations << employee.name
      end
    end

    [failed_emp_invitations, already_invited_employees]
  end

  def send_invitation(employee, calculated_start_date)
    existing_invitation = employee.invites.find_by(start_date_of_week: calculated_start_date)

    return :already_invited if existing_invitation

    employee.invites.create(start_date_of_week: calculated_start_date) ? true : :failed
  end

  def build_failure_message(failed_emp_invitations, already_invited_employees)
    message = {}

    message.merge!(
      unsent_invitations:
        I18n.t('invite.fail.sending', employee_list: failed_emp_invitations.to_sentence)
    ) unless failed_emp_invitations.empty?

    message.merge!(
      already_invited_employees:
        I18n.t('invite.fail.already_invited', employee_list: already_invited_employees.to_sentence)
    ) unless already_invited_employees.empty?

    message
  end
end
