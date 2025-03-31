Pod::Spec.new do |s|
  s.name             = 'SwiftlyUI'
  s.version          = '1.1.1'
  s.summary          = 'Swift-style declarative UIKit framework'
  s.homepage         = 'https://github.com/CoderLineChan/SwiftlyUI'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Your Name' => 'lianchen551@163.com' }
  s.source           = { :git => 'https://github.com/CoderLineChan/SwiftlyUI.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '13.0'
  s.swift_versions = ['5.0', '6.0']
  
  s.source_files = "SwiftlyUI/**/*.swift"

end