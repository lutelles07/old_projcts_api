Given(/^Sige Database: Prepare database to create file in NFS with (\d+) lines$/) do |lines|
  database_prepare_file_to_be_written(lines)
end

Given(/^Sige Database: Prepare database to read file from NFS$/) do
  database_prepare_to_read_file
end

Given(/^Sige Database: Get the next Sige File ID$/) do
  database_get_next_sige_file_id
end

Given(/^Sige Database: Get the last Sige File ID$/) do
  id_list = SigeFilesRepository.new.get_max_sige_file_id
  @id = id_list[0]["MAX(SATC_ID)"].to_i
  puts "Sige file id: #{@id}"
end

Given(/^Sige Database: Get the not existent Sige File ID$/) do
  id_list = SigeFilesRepository.new.get_max_sige_file_id
  @id = id_list[0]["MAX(SATC_ID)"].to_i + 2
  puts "Sige file id: #{@id}"
end

When(/^POST in Aldebaran\-SigeFiles with the last Sige File ID passing a "([^"]*)" authentication$/) do |authentication|
  @response = SigeFilesAPI.new(authentication).post(@id)
  Debug.new.debug(@response)
end

Then(/^Sige Database: Verify that file content was created$/) do
  sige_files_repository = SigeFilesRepository.new.sige_arquivo_txt_det_select(@id)
  puts "Sige database: #{sige_files_repository}"

  @file_content.size.should == sige_files_repository.size

  sige_files_repository.each_index do |index|
    sige_files_repository[index]["SATD_ID"].to_i.should == @id
    sige_files_repository[index]["SATD_SEQ"].to_i.should == index + 1
    sige_files_repository[index]["SATD_LINHA"].should == @file_content[index]
  end
end

Given(/^Sige Database: Delete files for id$/) do
  sige_files_repository = SigeFilesRepository.new
  sige_files_repository.sige_arquivo_txt_det_delete(@id)
  sige_files_repository.sige_arquivo_txt_cab_delete(@id)
end

Given(/^Sige Database: Update field "([^"]*)" to value "([^"]*)"$/) do |field, value|
  sige_files_repository = SigeFilesRepository.new.sige_arquivo_txt_cab_update(field, value, @id)
end


def get_file_content(lines)
  @file_content = []
  for i in 1..lines.to_i
    @file_content <<  "id:#{@id} #{Utils.new.get_time} line#{i} a#{i};b#{i};c#{i};d#{i};e#{i};f#{i}"
  end
  puts "File Content: #{@file_content}"
  @file_content
end

def database_prepare_to_read_file
  database_delete_file_content
  database_update_file_header("R")
end

def database_prepare_file_to_be_written(lines)
  database_get_next_sige_file_id
  create_file_header_with_type("W")
  create_file_content(lines)
end

def database_get_next_sige_file_id
  id_list = SigeFilesRepository.new.get_max_sige_file_id
  @id = id_list[0]["MAX(SATC_ID)"].to_i + 1
  puts "Sige file id: #{@id}"
end

def database_delete_file_content
  sige_files_repository = SigeFilesRepository.new
  sige_files_repository.sige_arquivo_txt_det_delete(@id)
end

def create_file_header_with_type(sige_file_type)
  sige_files_repository = SigeFilesRepository.new
  sige_files_repository.sige_arquivo_txt_cab_insert(@id)
end

def create_file_content(lines)
  sige_files_repository = SigeFilesRepository.new
  sige_files_repository.sige_arquivo_txt_det_insert(@id, lines, get_file_content(lines))
end

def database_update_file_header(sige_file_type)
  sige_files_repository = SigeFilesRepository.new
  sige_files_repository.sige_arquivo_txt_cab_update_type(@id,sige_file_type)
end

Then(/^I verify if the polling updated status for "([^"]*)"$/) do |status|
  sige_files_repository = SigeFilesRepository.new.sige_check_flag_leitura(@id)
  expect(sige_files_repository[0]['INFL_FLG_LEITURA']).to eq status
end
