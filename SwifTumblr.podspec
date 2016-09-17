#
# Be sure to run `pod lib lint SwifTumblr.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "SwifTumblr"
  s.version          = "0.3.0"
  s.summary          = "Fetch and parse tumblr blog."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
This library fetch tumblr blog and covert it to Swift objects.
                       DESC

  s.homepage         = "https://github.com/yosan/SwifTumblr"
  s.license          = 'MIT'
  s.author           = { "yosan" => "taka.yosuke@gmail.com" }
  s.source           = { :git => "https://github.com/yosan/SwifTumblr.git", :tag => s.version.to_s }

  s.platform     = :ios, '9.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'SwifTumblr' => ['Pod/Assets/*.png']
  }

  s.dependency 'Alamofire', '~> 4.0'
  s.dependency 'AEXML', '~> 4.0'

end
