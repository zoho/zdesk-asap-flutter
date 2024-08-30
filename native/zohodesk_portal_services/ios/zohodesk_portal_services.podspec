#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint zohodesk_portal_services.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'zohodesk_portal_services'
  s.version          = '2.0.0'
  s.summary          = 'Zoho Desk Portal Services'
  
  s.description      = 'Zoho Desk Portal Services'
  
  s.homepage         = 'https://help.zoho.com/portal/en/kb/desk/for-developers/asap/'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'DeskMobile' => 'support@zohodesk.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'ZohoDeskPortalCore', '4.0.0-beta.1'
  s.dependency 'ZohoDeskPortalChat', '4.0.0-beta.1'
  s.platform = :ios, '13.0'
  s.ios.deployment_target  = '13.0'

end
