#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint fast_rsa.podspec' to validate before publishing.
#
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
  s.source_files     = 'Classes/**/*'
  s.dependency 'FlutterMacOS'
  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
  #s.vendored_libraries  = 'librsa_bridge.dylib'
  s.resources = ['librsa_bridge.dylib']
  s.xcconfig = { 'LD_RUNPATH_SEARCH_PATHS' => '@loader_path/../Frameworks/fast_rsa.framework/Resources' }
end
