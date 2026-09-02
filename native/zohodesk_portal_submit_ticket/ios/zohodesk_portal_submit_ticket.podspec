#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint zohodesk_portal_submit_ticket.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'zohodesk_portal_submit_ticket'
  s.version          = '2.6.5'
  s.summary          = 'Zoho Desk Portal Submit Ticket'

  s.description      = 'Zoho Desk Portal Submit Ticket'

  s.homepage         = 'https://help.zoho.com/portal/en/kb/desk/for-developers/asap/'
  s.license          = { :type => 'MIT', :file => '../LICENSE' }
  s.author           = { 'DeskMobile' => 'support@zohodesk.com' }
  s.source           = { :path => '.' }
  s.source_files = 'zohodesk_portal_submit_ticket/Sources/zohodesk_portal_submit_ticket/**/*'
  s.dependency 'Flutter'
  s.dependency 'ZohoDeskPortalTicket', '4.6.8'
  s.dependency 'zohodesk_portal_apikit', "#{s.version}"
  s.platform = :ios, '13.0'
  s.ios.deployment_target  = '13.0'
  s.swift_version = '5.0'
end
