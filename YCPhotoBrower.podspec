Pod::Spec.new do |s|

s.name         = "YCPhotoBrower"
s.version      = "1.3.0"
s.ios.deployment_target = '8.0'
s.summary      = "a simple brower of photo."
s.homepage     = "https://github.com/WellsYC/YCPhotoBrower"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author       = { "WellsYC" => "461620115@qq.com" }
s.license      = "MIT"
s.source       = { :git => "https://github.com/WellsYC/YCPhotoBrower.git", :tag => s.version }
s.source_files  = 'YCPhotoBrowerCompont'
s.requires_arc = true
s.dependency 'SDWebImage', '~> 4.3.3'


end

