#
# Be sure to run `pod lib lint SCCSR.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SCCSR'
  s.version          = '0.1.0'
  s.summary          = 'Helper functions to create a Certificate Signature Request'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Helper functions to create a Certificate Signature Request.
                       DESC

  s.homepage         = 'https://github.com/libscudo/SCCSR-iOS'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'eaceto' => 'eaceto@afip.gob.ar' }
  s.source           = { :git => 'https://github.com/libscudo/SCCSR-iOS.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/eaceto_pub'

  s.ios.deployment_target = '10.0'

  s.source_files = 'SCCSR/Classes/**/*'
  
  s.frameworks = 'Security'

end
