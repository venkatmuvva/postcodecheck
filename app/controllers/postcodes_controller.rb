class PostcodesController < ApplicationController
  include PostcodesHelper
  before_action :is_xhr_request , :only =>  [:validate]

  def index
  end

  def validate
    postcode= params['postcode']
    external_api_response = validate_postcode_external_api(postcode)
    if external_api_response
      head :ok
    elsif validate_postcode_internal_list(postcode)
      head :ok
    else
      head 404
    end
  end

  private
  def is_xhr_request
    head  400 unless request.xhr?
  end
end
