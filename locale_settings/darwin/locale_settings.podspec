#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint locale_settings.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'locale_settings'
  s.version          = '1.0.0'
  s.summary          = 'A plugin which supports to change the current language on an os level.'
  s.description      = <<-DESC
A plugin which supports to change the current language on an os level.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Sven Op de Hipt' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.ios.dependency 'Flutter'
  s.ios.deployment_target = '11.0'
  s.osx.dependency 'FlutterMacOS'
  s.osx.deployment_target = '10.11'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
