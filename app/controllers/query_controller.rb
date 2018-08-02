class QueryController < ApplicationController
  def get

  	result = Beast.all.order(:external_id)

  	render plain: result.to_json

  end
end
