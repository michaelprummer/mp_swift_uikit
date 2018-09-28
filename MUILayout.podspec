#
# Be sure to run `pod lib lint MUILayout.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MUILayout'
  s.version          = '0.0.2'
  s.summary          = 'AutoLayout and UI crator tool for Swift.'
  s.swift_version	 = '4.2
  '
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Wrapper for simple creation of AutoLayout constraints and UI crator tool for meant for Swift Apps without Storyboard.'
                       

  s.homepage         = 'https://github.com/michaelprummer/mp_swift_uikit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Michael Prummer' => 'prummermichael@gmail.com' }
  s.source           = { :git => 'https://github.com/michaelprummer/mp_swift_uikit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'MUILayout/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MUILayout' => ['MUILayout/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
