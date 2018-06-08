#
# Be sure to run `pod lib lint ERNiftyExtensions.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ERNiftyExtensions'
  s.version          = '3.3.0'
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
  
  # s.resource_bundles = {
  #   'ERNiftyExtensions' => ['ERNiftyExtensions/Assets/*.png']
  # }

  s.ios.deployment_target = '10.0'

  s.default_subspec = 'Foundation'
  
  s.subspec 'Foundation' do |foundation|
      
      # Subspect for users that only with to have Foundation and Swift standard library extensions.
      
      foundation.ios.deployment_target = '10.0'
      
      foundation.watchos.deployment_target = '4.0'
      
      foundation.source_files = 'ERNiftyExtensions/Classes/Foundation/*.{swift}'
      
      foundation.dependency 'CryptoSwift'
      
      foundation.frameworks = 'Foundation', 'UIKit', 'CoreGraphics'

  end
  
  s.subspec 'CoreAnimation' do |ca|
      
      ca.ios.deployment_target = '10.0'
      ca.source_files = 'ERNiftyExtensions/Classes/CoreAnimation/*.{swift}'
  end
  
  s.subspec 'CoreLocation' do |cl|
      
      cl.ios.deployment_target = '10.0'
      cl.source_files = 'ERNiftyExtensions/Classes/CoreLocation/*.{swift}'
      cl.frameworks = 'CoreLocation'
  end
  
  s.subspec 'UIKit' do |ui|
      
      ui.ios.deployment_target = '10.0'
      ui.source_files = 'ERNiftyExtensions/Classes/UIKit/*.{swift}'
      ui.dependency 'ERNiftyExtensions/Foundation'
      ui.dependency 'ERNiftyExtensions/CoreAnimation'
      ui.frameworks = 'UIKit'
  end

end
