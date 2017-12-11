Then(/^Response body should have body with json$/) do |json|
  @response_new_server == json
  diff = HashDiff.diff(@response_new_server, JSON.parse(json))
end

Then(/^Compare Lockdown Responses$/) do
    Utils.new.compare_hashes(@response_old_server,@response_new_server)
end

Then(/^Verify if the response contains the field X\-tid$/) do
  @response.header["X-tid"].length.should > 0
end

Then(/^Verify if the response contains the field X\-tid with rigth value$/) do
  @response.header["X-tid"].should == @xtid
end


Then(/^Response body should have right json schema for "([^"]*)"$/) do |aldebaran_context|
  json_schema_response = ""
      case aldebaran_context

        when "recdocs"
          json_schema_response = Utils.new.read_json_file("features/support/json_schema/json_recdocs.yml" )
        when "products"
          json_schema_response = Utils.new.read_json_file("features/support/json_schema/json_products.yml" )

      end

    hash_diff = HashDiff.diff(json_schema_response,@response)
    hash_diff.size.should == 0
end
