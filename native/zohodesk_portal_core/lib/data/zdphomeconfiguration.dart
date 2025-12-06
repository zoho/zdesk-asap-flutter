class ZDPHomeConfiguration {
  bool enableCommunity;
  bool enableHelpCenter;
  bool enableMyTicket;
  bool enableCreateTicket;
  bool enableAddTopic;
  bool showChat;
  bool showGC;
  bool showAnswerBot;
  bool showBM;
  bool enableHeaderLogo;

  ZDPHomeConfiguration({
    this.enableCommunity = true,
    this.enableHelpCenter = true,
    this.enableMyTicket = true,
    this.enableCreateTicket = true,
    this.enableAddTopic = true,
    this.showChat = true,
    this.showGC = true,
    this.showAnswerBot = true,
    this.showBM = true,
    this.enableHeaderLogo = true,
  });

  Map toJson() => {
        'enableCommunity': enableCommunity,
        'enableHelpCenter': enableHelpCenter,
        'enableMyTicket': enableMyTicket,
        'enableCreateTicket': enableCreateTicket,
        'enableAddTopic': enableAddTopic,
        'showChat': showChat,
        'showGC': showGC,
        'showAnswerBot': showAnswerBot,
        'showBM': showBM,
        'enableHeaderLogo': enableHeaderLogo
  };
}