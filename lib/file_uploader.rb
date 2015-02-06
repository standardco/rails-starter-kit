class FileUploader
 
  def initialize(params = {})
    @bucket_name = ENV['BUCKET_NAME']
  end
 
  def upload_to(location, file)
    bucket.objects[location].write(:file => file)
    return "#{base_url}/#{@bucket_name}/#{location}"
  end
 
 
  private
 
  def base_url
    ENV['AWS_S3_URL']
  end
 
  def bucket
    AWS::S3.new.buckets[@bucket_name]
  end
 
end
