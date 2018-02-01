class FileUploader

  def initialize(params = {})
    @bucket_name = ENV['BUCKET_NAME']
  end

  def upload_to(location, file)
    s3 = Aws::S3::Resource.new
    object = s3.bucket(ENV['BUCKET_NAME']).object(location)
    object.upload_file(file)
    return "#{base_url}/#{@bucket_name}/#{location}"
  end

  private

  def base_url
    ENV['AWS_S3_URL']
  end

end
