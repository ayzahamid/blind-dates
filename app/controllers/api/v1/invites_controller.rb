# frozen_string_literal: true

module Api
  module V1
    class InvitesController < ApiController
      before_action :set_invite, only: :update

      def create
        result = ::SendInvitations.call(start_date_of_week: invitation_create_params[:start_date_of_week])

        if result.success?
          success_response(message: 'Invitations Sent Successfully!')
        else
          error_response(:unprocessable_entity, result.message)
        end
      end

      def update
        result = ::UpdateInvitationStatus.call(invite: @invite, status: invitation_update_params[:status])

        if result.success?
          success_response(message: result.message)
        else
          error_response(:unprocessable_entity, result.message)
        end
      end

      private

      def set_invite
        @invite = Invite.find(params[:id])
      end

      def invitation_create_params
        params.fetch(:invite, {}).permit(:start_date_of_week)
      end

      def invitation_update_params
        params.fetch(:invite, {}).permit(:status)
      end
    end
  end
end
