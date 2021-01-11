#
# Be sure to run `pod lib lint privateLibrary.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'privateLibrary'
  s.version          = '0.1.9'
  s.summary          = 'app private library'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'seed private library'

  s.homepage         = 'https://github.com/hj04210037/hj_library'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hujie' => '493518368@qq.com' }
  s.source           = { :git => 'https://github.com/hj04210037/hj_library.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  #s.source_files = 'privateLibrary/Classes/*'
  
  
  s.subspec 'GJNoCrash' do |ss|
    ss.source_files = 'privateLibrary/Classes/GJNoCrash/*'
  end
  
  s.subspec 'LYEmptyView' do |ss|
    ss.source_files = 'privateLibrary/Classes/LYEmptyView/*'
    ss.dependency 'header'
    ss.dependency 'hl'
  end
  
  s.subspec 'test' do |te|
    te.source_files ='privateLibrary/Classes/test/*'
  end

  
  
  

   s.resource_bundles = {
     'privateLibrary' => ['privateLibrary/Assets/*.png']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  
  #s.dependency 'SDWebImage'
  # s.dependency 'AFNetworking', '~> 2.3'
  
  #  s.dependency 'header'
  #  s.dependency 'hl'
  #  s.dependency 'Masonry'
end
