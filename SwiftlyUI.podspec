Pod::Spec.new do |s|
  s.name             = 'SwiftlyUI'
  s.version          = '1.0.2'
  s.summary          = 'Swift-style declarative UIKit framework'
  s.homepage         = 'https://github.com/CoderLineChan/SwiftlyUI'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Your Name' => 'lianchen551@163.com' }
  s.source           = { :git => 'https://github.com/CoderLineChan/SwiftlyUI.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '13.0'
  s.swift_versions = ['5.0', '6.0']
  
  # 核心模块
  s.subspec 'Core' do |core|
    core.source_files = 'Sources/Core/**/*.swift'
  end
  
  # # SnapKit 扩展
  # s.subspec 'SnapKitExt' do |ext|
  #   ext.source_files = 'Sources/SnapKitExt/**/*.swift'
  #   ext.dependency 'SwiftlyUI/Core'
  #   ext.dependency 'SnapKit'
  # end
  
  # 默认安装核心模块
  s.default_subspec = 'Core'
end