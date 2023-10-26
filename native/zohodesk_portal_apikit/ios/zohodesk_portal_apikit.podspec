#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint zohodesk_portal_apikit.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'zohodesk_portal_apikit'
  s.version          = '1.0.3'
  s.summary          = 'ASAP API Kit for Zoho Desk'
  
  s.description      = 'ASAP API Kit for Zoho Desk'
  
  s.homepage         = 'https://help.zoho.com/portal/en/kb/desk/for-developers/asap/'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'DeskMobile' => 'support@zohodesk.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'ZohoDeskPortalAPIKit', '3.0.0-beta.11'
  s.platform = :ios, '11.0'
  s.ios.deployment_target = '11.0'
end
