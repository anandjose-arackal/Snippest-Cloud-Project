S3 = Aws::S3::Resource.new(
  credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'],ENV['AWS_SECRET_ACCESS_KEY']) ,
    region: 'ap-southeast-1'
)