class QueryController < ApplicationController
  def get

  	result_payload = Hash.new

  	query = Beast.all.order(:external_id)

  	result_payload["found"] = query.count
  	result_payload["hits"] = query

  	render json: result_payload

  end
end
