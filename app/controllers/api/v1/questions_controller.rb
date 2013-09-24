module Api
  module V1
    class QuestionsController < ApplicationController
      respond_to :json

      def index
        render json: { :status => 'ok', :message => '', :questions => Question.all }
      end

    end
  end
end