#
# Be sure to run `pod lib lint ERNiftyExtensions.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ERNiftyExtensions'
  s.version          = '3.0.9'
  s.summary          = 'A library of helpful extensions for UIKit & Foundation that one iOS developer has picked up over the years.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'A codex of some very nifty extensions that make every day development just a tad easier. With classes ranging from A-Z, there is sure to be something for everyone here.'

  s.homepage         = 'https://github.com/erusso1/ERNiftyExtensions'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'erusso1' => 'ephraim.s.russo@gmail.com' }
  s.source           = { :git => 'https://github.com/erusso1/ERNiftyExtensions.git', :tag => s.version }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'ERNiftyExtensions/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ERNiftyExtensions' => ['ERNiftyExtensions/Assets/*.png']
  # }

  s.frameworks = 'UIKit', 'Foundation', 'CoreLocation'

  s.dependency 'CryptoSwift'
  s.dependency 'CommonCrypto'

end
