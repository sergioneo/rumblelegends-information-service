class QueryController < ApplicationController
  def get

  	number_per_page = params["limit"]
  	offset = params["offset"]
  	order_by = params["orderBy"]
  	start = params["start"]
  	asc = params["asc"]
  	comp = "<="
  	if asc = "ASC"
  		comp = ">="
  	end

  	result_payload = Hash.new

  	puts order_by
  	puts comp
  	puts start

  	query = Beast.where(order_by+" "+comp+" "+start)
  				 .limit(number_per_page)
  				 .offset(offset)
  				 .order(order_by+" "+asc)

  	big_query = Beast.where(order_by+" "+comp+" "+start)

  	result_payload["found"] = big_query.count
  	result_payload["hits"] = query

  	render json: result_payload

  end
end
