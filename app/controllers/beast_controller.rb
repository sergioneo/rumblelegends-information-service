class BeastController < ApplicationController
  def post
  end

  def get

    require 'json'

  	ext_id = params[:id]
  	beast = Beast.where(external_id: ext_id).first
  	if beast.blank?
  		req_url = ENV["CONTRACT_MASTER_SERVICE"]+"beast/get_information/"+ext_id.to_s
      beast = JSON.parse(Typhoeus.get(req_url, followlocation: true).body)

      beast_record = Beast.new
      beast_record.external_id = params[:id]
      beast_record.name = "Beast #"+params[:id].to_s
      beast_record.genes = beast["genes"]
      beast_record.beast_type = beast["race"]
      beast_record.sireId = beast["sireId"]
      beast_record.matronId = beast["matronId"]
      beast_record.generation = beast["generation"]
      beast_record.pedigree = beast["pedigree"]
      beast_record.element = beast["element"]
      beast_record.birthTime = Time.at(beast["birthTime"]).to_datetime
      beast_record.likes = 0
      beast_record.save

      render plain: beast_record.to_json
  	else
  		render plain: beast.to_json
  	end
  end
end
