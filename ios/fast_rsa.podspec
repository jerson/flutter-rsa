#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint fast_rsa.podspec' to validate before publishing.
#

xcframework_path = File.join(__dir__, "RSABridge.xcframework").gsub(/ /, '\ ')
Pod::Spec.new do |s|
  s.name             = 'fast_rsa'
  s.version          = '0.7.0'
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
  s.vendored_frameworks = 'RSABridge.xcframework'
  s.static_framework = true
  s.xcconfig = {
    'OTHER_LDFLAGS[sdk=iphoneos*]' => "$(inherited) -ObjC -force_load #{xcframework_path}/ios-arm64/RSABridge.framework/RSABridge",
    'OTHER_LDFLAGS[sdk=iphonesimulator*]' => "$(inherited) -ObjC -force_load #{xcframework_path}/ios-arm64_x86_64-simulator/RSABridge.framework/RSABridge",
    'OTHER_LDFLAGS[sdk=maccatalyst*]' => "$(inherited) -ObjC -force_load #{xcframework_path}/ios-arm64_x86_64-maccatalyst/RSABridge.framework/RSABridge"
  }
  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386'
  }

  s.swift_version = '5.0'

end
