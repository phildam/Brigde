# frozen_string_literal: true

module Response
  def json_render(jsonObject, status = :ok, **vargs)
    render json: jsonObject, status: status, **vargs
  end

  def empty_response(status = :no_content)
    head status
  end
end