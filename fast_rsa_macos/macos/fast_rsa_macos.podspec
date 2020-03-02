#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint rsa.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'fast_rsa_macos'
  s.version          = '0.0.1'
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
  
  #s.library = 'rsa'
  s.preserve_paths = 'Rsa.framework'
  s.xcconfig = { 'OTHER_LDFLAGS' => '-framework Rsa' }
  s.vendored_frameworks = 'Rsa.framework'
  
  #s.resources = ['Classes/*.a']
  #s.preserve_paths = 'Classes/*.a'
  #s.vendored_libraries = 'Classes/*.a'
  
  #s.public_header_files = 'Classes/**/*.h'
  #s.header_mappings_dir = 'Classes'
  #s.xcconfig  =  { 'LIBRARY_SEARCH_PATHS' => "#{File.join(File.dirname(__FILE__), 'Classes')}" }
    
  
end
