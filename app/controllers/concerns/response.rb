# frozen_string_literal: true

module Response
  def json_render(jsonObject, status = :ok, **vargs)
    render json: jsonObject, status: status, **vargs
  end

  def render_error(reason)
    json_render({ status: 'failed', reason: reason }, status: :unprocessable_entity)
  end

  def empty_response(status = :no_content)
    head status
  end
end