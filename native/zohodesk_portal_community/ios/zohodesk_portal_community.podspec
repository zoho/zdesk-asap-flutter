#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint zohodesk_portal_community.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'zohodesk_portal_community'
  s.version          = '1.0.6'
  s.summary          = 'Zoho Desk Portal Community'
  
  s.description      = 'Zoho Desk Portal Community'
  
  s.homepage         = 'https://help.zoho.com/portal/en/kb/desk/for-developers/asap/'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'DeskMobile' => 'support@zohodesk.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'ZohoDeskPortalCommunity', '3.0.0-beta.17'
  s.platform = :ios, '11.0'
  s.ios.deployment_target  = '11.0'
end
