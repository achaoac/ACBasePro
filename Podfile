# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

source 'https://github.com/achaoac/ACEasyKitSpec.git'

target 'ACBasePro' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # 私有基础仓库
  pod 'ACEasyKit'
  # Pods for BasePro
  pod 'Masonry'
  pod 'YYModel'
  # 大并发串行队列
  pod 'YYDispatchQueuePool'
  # 显示 gif
  pod 'FLAnimatedImage'
  pod 'YYImage'
  pod 'SDWebImage'

  post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
      end
    end
end
