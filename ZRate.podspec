Pod::Spec.new do |spec|

  spec.name         = "ZRate"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of ZRate."
  spec.description  = <<-DESC
                   My Library
                   DESC

  spec.homepage     = "http://EXAMPLE/ZRate"

  spec.license      = "MIT"

  spec.author             = { "jblaine" => "jblaine" }

  #spec.source       = { :git => "http://EXAMPLE/ZLogin.git", :tag => "#{spec.version}" }
  spec.source       = { :git => "https://github.com/jalajoninc/ZRate.git", :tag => "1.0.0" }

#  spec.source_files  = "**/*.{h,m,a}"
  
  spec.source_files  = "ZRate/**/*.{h,a,swift}"

  
#  spec.source_files  = "Classes", "Classes/**/*.{h,m}"
#  spec.exclude_files = "Classes/Exclude"
  spec.exclude_files = "ZRate/**/*.plist"


end
