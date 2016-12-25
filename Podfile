# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'PuzzDraRssReader' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  source 'https://github.com/CocoaPods/Specs.git'
  use_frameworks!
  platform :ios, '9.0'

  # Pods for PuzzDraRssReader
 pod 'Alamofire', :git => 'https://github.com/Alamofire/Alamofire.git'
 pod 'SwiftyJSON'
 pod 'SVProgressHUD'
 pod 'TOWebViewController'
 pod 'PageMenu', :git => 'https://github.com/orazz/PageMenu.git'
 pod "HTMLReader"
 pod 'PullToRefreshSwift'

  target 'PuzzDraRssReaderTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'PuzzDraRssReaderUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end
