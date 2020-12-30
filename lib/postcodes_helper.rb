module PostcodesHelper

  def validate_postcode_external_api(postcode)
    if postcode.blank?
      false
    else
      begin
        uri = URI(EXTERNAL_API_URL + postcode)
        response = Net::HTTP.get(uri) # => String
        response_json = JSON.parse(response)
        response_json['status'] == 200 ? true : false
      rescue Exception
        console.log("Error occurred while invoking the external API" + Exception.to_s)
        false
      end
    end
  end

  def validate_postcode_internal_list(postcode)
    if postcode.blank?
      false
    else
      postcode_upcase = postcode.gsub(/[ ]/, "").upcase
      VALID_POSTCODES_INTERNAL_LIST.include?(postcode_upcase)
    end
  end

end
