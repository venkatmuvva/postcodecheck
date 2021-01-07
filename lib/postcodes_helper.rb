module PostcodesHelper

  def validate_postcode_external_api(postcode)
    if postcode.blank?
      false
    else
        postcode = postcode.gsub(/[ ]/, "")
        uri = URI(EXTERNAL_API_URL + postcode)
        response = Net::HTTP.get(uri) # => String
        response_json = JSON.parse(response)
        status =  response_json['status']
        result = response_json['result']
        lsoa = result['lsoa'] unless result.blank?
        return false if status.blank? || lsoa.blank?
        lsoa = lsoa.downcase  unless lsoa.blank?
        ((status == 200)  && lsoa.start_with?('southwark', 'lambeth')) ? true : false
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
