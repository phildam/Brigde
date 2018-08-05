# frozen_string_literal: true

module ExceptionHandler extend ActiveSupport::Concern
  included do
    rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError do |e|
      json_render({ error: 'no_record_found' }, :not_found)
    end

    rescue_from ActionController::ParameterMissing, ActiveRecord::RecordInvalid do |e|
      json_render({ status: 'failed', reason: e.message }, :unprocessable_entity)
    end

    rescue_from ActionController::InvalidAuthenticityToken do |e|
      json_render({ error: e.message, message: 'not-authorized'}, :unauthorized)
    end
  end
end
