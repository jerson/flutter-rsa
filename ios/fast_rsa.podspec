#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint fast_rsa.podspec' to validate before publishing.
#
framework_path = File.join(__dir__, "Rsa.xcframework").gsub(/ /, '\ ')

Pod::Spec.new do |s|
  s.name             = 'fast_rsa'
  s.version          = '0.6.0'
  s.summary          = 'library for use RSA.'
  s.description      = <<-DESC
library for use RSA.
                       DESC
  s.homepage         = 'https://github.com/jerson/flutter-rsa'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Gerson Alexander Pardo Gamez' => 'jeral17@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files =  'Classes/**/*'

  s.dependency 'Flutter'
  s.platform = :ios, '12.0'
  s.vendored_frameworks = 'Rsa.xcframework'
  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.xcconfig = {
    'OTHER_LDFLAGS[sdk=iphoneos*]' => "-force_load '#{framework_path}/ios-arm64/librsa_bridge.a'",
    'OTHER_LDFLAGS[sdk=iphonesimulator*]' => "-force_load '#{framework_path}/ios-arm64_x86_64-simulator/librsa_bridge.a'",
    'OTHER_LDFLAGS[sdk=maccatalyst*]' => "-force_load '#{framework_path}/ios-arm64_x86_64-maccatalyst/librsa_bridge.a'"
  }
  s.pod_target_xcconfig = { 
    'DEFINES_MODULE' => 'YES', 
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386',
  }
  s.swift_version = '5.0'

end
