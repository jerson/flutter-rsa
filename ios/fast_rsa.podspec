#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint rsa.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'fast_rsa'
  s.version          = '0.2.0'
  s.summary          = 'library for use RSA.'
  s.description      = <<-DESC
library for use RSA.
                       DESC
  s.homepage         = 'https://github.com/jerson/flutter-rsa'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Gerson Alexander Pardo Gamez' => 'jeral17@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'
  s.preserve_paths = 'Rsa.framework'
  s.xcconfig = { 'OTHER_LDFLAGS' => '-framework Rsa' }
  s.vendored_frameworks = 'Rsa.framework'
  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
end
