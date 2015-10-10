
Pod::Spec.new do |s|
  s.name             = "WYLVolumeManager"
  s.version          = “1.0.0”
  s.summary          = "Custom iPhone Volume View"
  s.description      = <<-DESC
			Custom iPhone Volume View.553836854@qq.com            
                       DESC
  s.homepage         = "https://github.com/wangyanlong/WYLVolumeView"
  s.license          = 'MIT'
  s.author           = { "王颜龙" => "553836854@qq.com" }
  s.source           = { :git => "https://github.com/wangyanlong/WYLVolumeView.git", :tag => s.version.to_s }
  s.platform     = :ios, ‘7.0’
  s.requires_arc = true

  s.source_files = 'WYLCoreDataTableViewDemo/WYLCoreDataTableView/WYLCoreDataTableView/*.{h,m}'
  # s.resources = 'Assets'

  # s.ios.exclude_files = 'Classes/osx'
  # s.osx.exclude_files = 'Classes/ios'
  # s.public_header_files = 'Classes/**/*.h'
  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit', 'CoreData'

end