# frozen_string_literal: true

module Api
  module V1
    class GroupsController < ApiController
      def index
        @groups = Group.where(start_date_of_week: date_param)
      end

      def create
        result = GenerateGroups.call

        if result.success?
          render json: { message: 'Groups generated successfully' }
        else
          error_response(:unprocessable_entity, result.message)
        end
      end

      private

      def date_param
        Date.parse(params.require(:start_date)).beginning_of_week
      end
    end
  end
end
