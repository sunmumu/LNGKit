Pod::Spec.new do |s|
  s.name         = 'LNGKit'
  s.version      = '0.1.4'
  s.summary      = 'A collection of iOS components.'
  s.homepage     = 'https://github.com/sunmumu/LNGKit'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'sunmumu' => '335089101@qq.com' }
  s.platform     = :ios, '11.0'
  s.ios.deployment_target = '11.0'
  s.source       = { :git => 'https://github.com/sunmumu/LNGKit.git', :tag => s.version.to_s }
  s.requires_arc = true
  s.source_files = 'LNGKit/**/*.swift'
  s.swift_version = '4.0', '4.1', '4.2','5.0', '5.1', '5.2', '5.3'
  
  s.libraries = 'z'
  s.frameworks = 'UIKit', 'CoreFoundation'
  

end