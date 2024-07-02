
class ZDPTicketConfiguration {

  bool _isReplyAllowed = true;
  bool _isCommentAllowed = true;
  bool _isTicketUpdateAllowed = true;
  bool _isCommentEditAllowed = true;
  bool _isCommentDeleteAllowed = true;
  bool _isAddTicketAllowed = true;
  bool _isHappinessThreadAllowed = true;
  bool _isTicketPropertiesAllowed = true;
  bool _isTicketChannelAllowed = true;
  bool _isTicketDetailSearchAllowed = true;

  set isReplyAllowed(bool isAllowed) => _isReplyAllowed = isAllowed;
  set isCommentAllowed(bool isAllowed) => _isCommentAllowed = isAllowed;
  set isTicketUpdateAllowed(bool isAllowed) => _isTicketUpdateAllowed = isAllowed;
  set isCommentEditAllowed(bool isAllowed) => _isCommentEditAllowed = isAllowed;
  set isCommentDeleteAllowed(bool isAllowed) => _isCommentDeleteAllowed = isAllowed;
  set isAddTicketAllowed(bool isAllowed) => _isAddTicketAllowed = isAllowed;
  set isHappinessThreadAllowed(bool isAllowed) => _isHappinessThreadAllowed = isAllowed;
  set isTicketPropertiesAllowed(bool isAllowed) => _isTicketPropertiesAllowed = isAllowed;
  set isTicketChannelAllowed(bool isAllowed) => _isTicketChannelAllowed = isAllowed;
  set isTicketDetailSearchAllowed(bool isAllowed) => _isTicketDetailSearchAllowed = isAllowed;

  bool get isReplyAllowed => _isReplyAllowed;
  bool get isCommentAllowed => _isCommentAllowed;
  bool get isTicketUpdateAllowed => _isTicketUpdateAllowed;
  bool get isCommentEditAllowed => _isCommentEditAllowed;
  bool get isCommentDeleteAllowed => _isCommentDeleteAllowed;
  bool get isAddTicketAllowed => _isAddTicketAllowed;
  bool get isHappinessThreadAllowed => _isHappinessThreadAllowed;
  bool get isTicketPropertiesAllowed => _isTicketPropertiesAllowed;
  bool get isTicketChannelAllowed => _isTicketChannelAllowed;
  bool get isTicketDetailSearchAllowed => _isTicketDetailSearchAllowed;

  Map toJson() => {
    'isReplyAllowed' : isReplyAllowed,
    'isCommentAllowed' : isCommentAllowed,
    'isTicketUpdateAllowed' : isTicketUpdateAllowed,
    'isCommentEditAllowed' : isCommentEditAllowed,
    'isCommentDeleteAllowed' : isCommentDeleteAllowed,
    'isAddTicketAllowed' : isAddTicketAllowed,
    'isHappinessThreadAllowed' : isHappinessThreadAllowed,
    'isTicketPropertiesAllowed' : isTicketPropertiesAllowed,
    'isTicketChannelAllowed' : isTicketChannelAllowed,
    'isTicketDetailSearchAllowed' : isTicketDetailSearchAllowed
  };

}