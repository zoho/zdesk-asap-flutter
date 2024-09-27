#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint zohodesk_portal_submit_ticket.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'zohodesk_portal_submit_ticket'
  s.version          = '1.1.7'
  s.summary          = 'Zoho Desk Portal Submit Ticket'

  s.description      = 'Zoho Desk Portal Submit Ticket'

  s.homepage         = 'https://help.zoho.com/portal/en/kb/desk/for-developers/asap/'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'DeskMobile' => 'support@zohodesk.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'ZohoDeskPortalTicket', '3.0.16'
  s.dependency 'zohodesk_portal_apikit', "#{s.version}"
  s.platform = :ios, '13.0'
  s.ios.deployment_target  = '13.0'
end
