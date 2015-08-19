require 'spec_helper'
require './managers/file_manager'


describe FileManager do
  before :each do
    @base_64_encoded_data = 'some_base_64_coded_info'
    @image_type = 'png'
    @write_mode = 'w'
    @file_manager = FileManager.new
    @extension_delimiter = '.'
    @file_mock = double('file handler')
    @uid = "2d931510-d99f-494a-8c67-87feb05e1594"
    @expected_file_name = @uid + @extension_delimiter + @image_type
    @expected_complete_file_path = Dir.pwd + "/media/" + @expected_file_name
    allow(SecureRandom).to receive(:uuid).and_return(@uid)
  end

  it 'should save the image file with the right name and extension' do
    expect(File).to receive(:open).with(@expected_complete_file_path, @write_mode).and_yield(@file_mock)
    expect(@file_mock).to receive(:write).with(Base64.decode64(@base_64_encoded_data))

    @file_manager.save_image @base_64_encoded_data, @image_type
  end

  it 'should save the image file under media folder' do
    @file_manager.save_image @base_64_encoded_data, @image_type
    expect(File.exists?(@expected_complete_file_path)).to eq(true)
    delete_temp_file
  end

  it 'should generate the image name using a universal identifier as its name: e.g. uid.image_type' do
    file_name = @file_manager.save_image @base_64_encoded_data, @image_type
    expect(file_name).to eq(@expected_file_name)
    delete_temp_file
  end

  def delete_temp_file
    File.delete(@expected_complete_file_path)
  end
end
