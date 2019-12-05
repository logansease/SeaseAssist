#
# Be sure to run `pod lib lint SeaseAssist.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "SeaseAssist"
  s.version          = "0.0.83"
  s.summary          = "A Library of Awesome Helper classes and extensions designed to help you work quickly and effeciently during iOS Development."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
"A Library of Awesome Helper classes designed to help you work quickly and effeciently during iOS Development.
Based on the concept that we should create simple one line accessors to commonly written code, there by making our code more reusable and and readable."
DESC

  s.homepage         = "https://github.com/logansease/SeaseAssist"
  # s.screenshots     = ""
  s.license          = 'MIT'
  s.author           = { "Logan Sease" => "lsease@ipartymobile.com" }
  s.source           = { :git => "https://github.com/logansease/SeaseAssist.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/logansease'

  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.swift_version = '4.0'

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
#'SeaseAssist' => ['Pod/Assets/*.png']
  }

    s.public_header_files = 'Pod/Classes/**/*.h'
    s.frameworks = 'UIKit', 'Foundation', 'CoreGraphics', 'SystemConfiguration',  'AVFoundation'
end
