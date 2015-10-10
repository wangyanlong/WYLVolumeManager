
Pod::Spec.new do |s|
  s.name             = "WYLVolumeManager"
  s.version          = "1.0.1"
  s.summary          = "Help developers custom iPhone Volume View"
  s.description      = <<-DESC
			Help developers custom iPhone Volume View. 553836854@qq.com            
                       DESC
  s.homepage         = "https://github.com/wangyanlong/WYLVolumeManager"
  # s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "王颜龙" => "553836854@qq.com" }
  s.source           = { :git => "https://github.com/wangyanlong/WYLVolumeManager.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/NAME'

  s.platform     = :ios, '7.0'
  # s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.source_files = 'WYLVolumeManagerFile/*.{h,m}'
  # s.resources = 'Assets'

  # s.ios.exclude_files = 'Classes/osx'
  # s.osx.exclude_files = 'Classes/ios'
  # s.public_header_files = 'Classes/**/*.h'
  s.frameworks = 'UIKit', 'AVFoundation', 'MediaPlayer', 'Foundation'

end
