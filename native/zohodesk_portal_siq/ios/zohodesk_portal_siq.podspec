#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint zohodesk_portal_siq.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'zohodesk_portal_siq'
  s.version          = '2.2.2'
  s.summary          = 'Zoho Desk Portal Chat'
  
  s.description      = 'Zoho Desk Portal Chat'
  
  s.homepage         = 'https://help.zoho.com/portal/en/kb/desk/for-developers/asap/'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'DeskMobile' => 'support@zohodesk.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'ZohoDeskPortalSalesIQ', '4.2.0'
  s.platform = :ios, '13.0'
  s.ios.deployment_target  = '13.0'
end
