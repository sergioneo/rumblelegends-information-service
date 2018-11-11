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

    where = order_by+" "+comp+" "+start

    unless params["owner"].blank?
      where += " AND owner = '"+params["owner"]+"'"
    end

  	result_payload = Hash.new

  	query = Beast.where(where)
  				 .limit(number_per_page)
  				 .offset(offset)
  				 .order(order_by+" "+asc)

  	big_query = Beast.where(order_by+" "+comp+" "+start)

  	result_payload["found"] = big_query.count
  	result_payload["hits"] = query

  	render json: result_payload

  end
end
