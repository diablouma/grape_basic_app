class FileManager
  def save_image base_64_encoded_data, image_type
    file_name = build_file_name(image_type)
    File.open(build_complete_path_to_image(file_name), "w") do |file|
      file.write(decode_image(base_64_encoded_data))
    end
    return file_name
  end

  def build_complete_path_to_image file_name
    return Dir.pwd + "/media/" + file_name
  end

  def build_file_name image_type
    extension_delimiter = "."
    return SecureRandom.uuid() + extension_delimiter + image_type
  end

  def decode_image base_64_encoded_data
    Base64.decode64(base_64_encoded_data)
  end
end
