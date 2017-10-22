#
# Be sure to run `pod lib lint MASCoolAlertView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MASCoolAlertView'
  s.version          = '0.1.0'
  s.summary          = 'Cool Alert View created by Michael Abadi Santoso.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Example of Alert View with different animation and customizable properties. This alert view is called MASCoolAlertView created by Michael Abadi Santoso. People can use it for showing their alert view easily and customize the appearance of the alert view
                       DESC

  s.homepage         = 'https://github.com/abadikaka/MASCoolAlertView'
  s.screenshots      = 'https://imgur.com/pW3SAk1', 'https://imgur.com/OTf8k64'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'abadikaka' => 'abadi_kaka@yahoo.com', 'Michael Abadi Santoso' => 'michael.abadi@ti.ukdw.ac.id' }
  s.source           = { :git => 'https://github.com/abadikaka/MASCoolAlertView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'MASCoolAlertView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MASCoolAlertView' => ['MASCoolAlertView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
