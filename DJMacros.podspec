#
# Be sure to run `pod lib lint DJMacros.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DJMacros'
  s.version          = '0.5.10'
  s.summary          = 'DJMacros全局宏定义 用于快速生成开发项目-增加基础宏定义'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
DJMacros全局宏定义 用于快速生成开发项目
作为一个工具类集成到项目中
                       DESC

  s.homepage         = 'https://github.com/cheneylew/DJMacro'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Deju Liu' => 'cheneylew@163.com' }
  s.source           = { :git => 'https://github.com/cheneylew/DJMacro.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'DJMacros/Classes/*'

  s.subspec 'Extension' do |extension|
    extension.source_files = 'DJMacros/Classes/Extension/**/*'
    #extension.public_header_files = 'DJMacros/Classes/Extension/**/*.h'
    #extension.dependency 'OpenUDID', '~> 1.0.0'
  end

  # s.resource_bundles = {
  #   'DJMacros' => ['DJMacros/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
