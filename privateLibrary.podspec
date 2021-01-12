#
# Be sure to run `pod lib lint privateLibrary.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'privateLibrary'
  s.version          = '0.3.5'
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
  
  
  s.subspec 'CountDown' do |co|
      co.source_files ='privateLibrary/Classes/CountDown/*'
  end
  
  
  s.subspec 'IQKeyboardManager' do |subIq|
       subIq.source_files ='privateLibrary/Classes/IQKeyboardManager/*'
       subIq.subspec 'Constants' do |co|
            co.source_files ='privateLibrary/Classes/IQKeyboardManager/Constants/*'
        end
        
        
        subIq.subspec 'IQTextView' do |iq|
            iq.dependency 'privateLibrary/IQKeyboardManager/Constants'
            iq.source_files ='privateLibrary/Classes/IQKeyboardManager/IQTextView/*'
        end
        
        subIq.subspec 'Categories' do |ca|
            ca.dependency 'privateLibrary/IQKeyboardManager/Constants'
            ca.source_files ='privateLibrary/Classes/IQKeyboardManager/Categories/*'
        end
        
        subIq.subspec 'IQToolbar' do |tb|
            tb.dependency 'privateLibrary/IQKeyboardManager/Categories'
            tb.source_files ='privateLibrary/Classes/IQKeyboardManager/IQToolbar/*'
        end
        
        
  end
  
  s.subspec 'CountDown' do |ss|
    ss.source_files ='privateLibrary/Classes/TTGTagCollectionView/*'
  end
  
  s.subspec 'DashLine' do |ss|
    ss.source_files ='privateLibrary/Classes/DashLine/*'
  end
  
  s.subspec 'Wonderful_HeadLine' do |ss|
    ss.source_files ='privateLibrary/Classes/Wonderful_HeadLine/*'
  end
  
  s.subspec 'WMZDropDownMenu' do |ss|
    ss.source_files ='privateLibrary/Classes/WMZDropDownMenu/*'
  end
  
  
  s.subspec 'XHLaunchAd' do |ss|
       ss.subspec 'UIViewController+' do |sss|
            sss.source_files ='privateLibrary/Classes/XHLaunchAd/UIViewController+/*'
       end
       
       ss.subspec 'Lib' do |sss|
            sss.subspec 'FLAnimatedImage' do |ssss|
                ssss.source_files ='privateLibrary/Classes/XHLaunchAd/Lib/FLAnimatedImage/*'
            end
       end
       
       ss.subspec 'XHLaunchAd' do |sss|
            sss.dependency 'privateLibrary/XHLaunchAd/Lib/FLAnimatedImage'
            sss.source_files ='privateLibrary/Classes/XHLaunchAd/XHLaunchAd/*'
       end
       
       
  end

  s.subspec 'TZImagePickerController' do |ss|
    ss.source_files ='privateLibrary/Classes/TZImagePickerController/*'
  end
  
  s.subspec 'SDCycleScrollView' do |ss|
    ss.dependency 'SDWebImage'
    ss.source_files ='privateLibrary/Classes/SDCycleScrollView/**/*'
    ss.subspec 'PageControl' do |sss|
        sss.source_files ='privateLibrary/Classes/SDCycleScrollView/PageControl/**/*'
    end
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
