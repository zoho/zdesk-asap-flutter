
class ZDPConfiguration {

  bool _isSideMenuEnabled = true;
  bool _isLangChooserEnabled = true;
  bool _isPoweredByFooterEnabled = true;
  bool _isGlobalSearchEnabled = true;
  bool _isKBEnabled = true;
  bool _isCommunityEnabled = true;
  bool _isSubmitTicketEnabled = true;
  bool _isAddTopicEnabled = true;
  bool _isMyTicketsEnabled = true;
  bool _isLiveChatEnabled = true;
  bool _isChatBotEnabled = true;
  bool _isAttachmentDownloadEnabled = true;
  bool _isAttachmentUploadEnabled = true;
  bool _isModuleBasedSearchEnabled = false;
  bool _disableScreenShot = false;
  bool _disableCutCopy = false;

  set isSideMenuEnabled(bool isEnabled) => _isSideMenuEnabled = isEnabled;
  set isLangChooserEnabled(bool isEnabled) => _isLangChooserEnabled = isEnabled;
  set isPoweredByFooterEnabled(bool isEnabled) => _isPoweredByFooterEnabled = isEnabled;
  set isGlobalSearchEnabled(bool isEnabled) => _isGlobalSearchEnabled = isEnabled;
  set isKBEnabled(bool isEnabled) => _isKBEnabled = isEnabled;
  set isCommunityEnabled(bool isEnabled) => _isCommunityEnabled = isEnabled;
  set isSubmitTicketEnabled(bool isEnabled) => _isSubmitTicketEnabled = isEnabled;
  set isAddTopicEnabled(bool isEnabled) => _isAddTopicEnabled = isEnabled;
  set isMyTicketsEnabled(bool isEnabled) => _isMyTicketsEnabled = isEnabled;
  set isLiveChatEnabled(bool isEnabled) => _isLiveChatEnabled = isEnabled;
  set isChatBotEnabled(bool isEnabled) => _isChatBotEnabled = isEnabled;
  set isAttachmentDownloadEnabled(bool isEnabled) => _isAttachmentDownloadEnabled = isEnabled;
  set isAttachmentUploadEnabled(bool isEnabled) => _isAttachmentUploadEnabled = isEnabled;
  set isModuleBasedSearchEnabled(bool isEnabled) => _isModuleBasedSearchEnabled = isEnabled;
  set disableScreenShot(bool isEnabled) => _disableScreenShot = isEnabled;
  set disableCutCopy(bool isEnabled) => _disableCutCopy = isEnabled;

  bool get isSideMenuEnabled => _isSideMenuEnabled;
  bool get isLangChooserEnabled => _isLangChooserEnabled;
  bool get isPoweredByFooterEnabled => _isPoweredByFooterEnabled;
  bool get isGlobalSearchEnabled => _isGlobalSearchEnabled;
  bool get isKBEnabled => _isKBEnabled;
  bool get isCommunityEnabled => _isCommunityEnabled;
  bool get isSubmitTicketEnabled => _isSubmitTicketEnabled;
  bool get isAddTopicEnabled => _isAddTopicEnabled;
  bool get isMyTicketsEnabled => _isMyTicketsEnabled;
  bool get isLiveChatEnabled => _isLiveChatEnabled;
  bool get isChatBotEnabled => _isChatBotEnabled;
  bool get isAttachmentDownloadEnabled => _isAttachmentDownloadEnabled;
  bool get isAttachmentUploadEnabled => _isAttachmentUploadEnabled;
  bool get isModuleBasedSearchEnabled => _isModuleBasedSearchEnabled;
  bool get disableScreenShot => _disableScreenShot;
  bool get disableCutCopy => _disableCutCopy;

  Map toJson() => {
    'isSideMenuEnabled' : isSideMenuEnabled,
    'isLangChooserEnabled' : isLangChooserEnabled,
    'isPoweredByFooterEnabled' : isPoweredByFooterEnabled,
    'isGlobalSearchEnabled' : isGlobalSearchEnabled,
    'isKBEnabled' : isKBEnabled,
    'isCommunityEnabled' : isCommunityEnabled,
    'isSubmitTicketEnabled' : isSubmitTicketEnabled,
    'isAddTopicEnabled' : isAddTopicEnabled,
    'isMyTicketsEnabled' : isMyTicketsEnabled,
    'isLiveChatEnabled' : isLiveChatEnabled,
    'isChatBotEnabled' : isChatBotEnabled,
    'isAttachmentDownloadEnabled' : isAttachmentDownloadEnabled,
    'isAttachmentUploadEnabled' : isAttachmentUploadEnabled,
    'isModuleBasedSearchEnabled' : isModuleBasedSearchEnabled,
    'disableScreenShot' : disableScreenShot,
    'disableCutCopy' : disableCutCopy,
  };

}