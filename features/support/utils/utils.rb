require 'date'

class Utils

  def read_json_file(file_path)
      json_template_hash = YAML.load_file(file_path)
  end

  def sort_array(list, field)
    list.sort_by { |list_item| list_item[field] }
  end

  def compare_hashes(hash_expected,hash_actual)
    hash_expected,hash_actual = exclude_domain_server_to_compare_server_responses(hash_expected,hash_actual)
    hash_diff = HashDiff.diff(hash_expected,hash_actual)
    if hash_diff.size > 0
       hash_diff.keys.each do |key|
         puts "hash_expected: key: #{key} - #{hash_diff[key][0]}"
         puts "hash_actual  : key: #{key} - #{hash_diff[key][1]}"
      end
    end
    hash_diff.size.should == 0
  end

  def exclude_domain_server_to_compare_server_responses(response_old_server,response_new_server)
        hash_response_new_server = exclude_domain_server(response_new_server, "new")
        hash_response_old_server = exclude_domain_server(response_old_server, "old")
        return hash_response_old_server,hash_response_new_server
  end

  def exclude_domain_server(response, server)
      domain_list = []
      if response["links"] != nil
        if server == "new"
            response["links"].each do |link|
              linka = link["href"].split("/")
              domain_list << "#{linka[0]}/#{linka[1]}/#{linka[2]}/#{linka[3]}"
            end
        else
            response["links"].each do |link|
              linka = link["href"].split("/")
              domain_list << "#{linka[0]}/#{linka[1]}/#{linka[2]}"
            end
        end
      end
      response_without_domain = exclude_domain(response, domain_list.uniq)
  end

  def exclude_domain(response, domain_list)
      response = response.to_json
      domain_list.each do |domain|
        response = response.gsub(domain,"")
        response = response.gsub(" ","")
      end
      JSON.parse(response)
  end

  def assertEqualDates(response_service_date,database_date)
    date_time_response  = DateTime.parse(response_service_date)
    date_time_database  = DateTime.parse(database_date)
    date_time_response.year.should == date_time_database.year
    date_time_response.month.should == date_time_database.month
    date_time_response.day.should == date_time_database.day
  end

  def get_random_value_from_list(list)
    list[Random.new.rand(list.size)]
  end

  def create_file(name_file, content_file)
      myfile = File.new(name_file, "w+")
      myfile.puts(content_file)
  end

  def get_time
      current_time = DateTime.now
      current_time.strftime "%Y%m%d-%H:%M:%S"
  end

  def file_content(line)
      file_content = ""
      for i in 1..line
        file_content = file_content + "#{get_time} line#{i} a#{i};b#{i};c#{i};d#{i};e#{i};f#{i}\n"
      end
      file_content
  end

  def compare_arrays(array_expected, array_actual)
      result = array_expected - array_actual == array_actual -  array_expected
      result.should == true
  end

  def remove_accents(string)

    return string.tr(
        "ÀÁÂÃÄÅàáâãäåĀāĂăĄąÇçĆćĈĉĊċČčÐðĎďĐđÈÉÊËèéêëĒēĔĕĖėĘęĚěĜĝĞğĠġĢģĤĥĦħÌÍÎÏìíîïĨĩĪīĬĭĮįİıĴĵĶķĸĹĺĻļĽľĿŀŁłÑñŃńŅņŇňŉŊŋÒÓÔÕÖØòóôõöøŌōŎŏŐőŔŕŖŗŘřŚśŜŝŞşŠšſŢţŤťŦŧÙÚÛÜùúûüŨũŪūŬŭŮůŰűŲųŴŵÝýÿŶŷŸŹźŻżŽž",
        "AAAAAAaaaaaaAaAaAaCcCcCcCcCcDdDdDdEEEEeeeeEeEeEeEeEeGgGgGgGgHhHhIIIIiiiiIiIiIiIiIiJjKkkLlLlLlLlLlNnNnNnNnnNnOOOOOOooooooOoOoOoRrRrRrSsSsSsSssTtTtTtUUUUuuuuUuUuUuUuUuUuWwYyyYyYZzZzZz"
    )
  end

end
