class ImageResUtils {
  static String teamLogo(String abbr) {
    return highlightTeamLogo(abbr);
  }

  static String teamGameLogo(String abbr) {
    if (abbr.isEmpty) abbr = "NBA";
    return "https://res.nba.cn/media/img/teams/00/game_logo/${abbr}_logo.png";
  }

  static String highlightTeamLogo(String abbr) {
    if (abbr.isEmpty) abbr = "NBA";
    return "https://res.nba.cn/media/img/teams/light/${abbr}_logo.png";
  }
  static String teamTranslucenceLogoDefault = "https://res.nba.cn/media/img/teams/playercard_teamlogos/NBA_logo.png";
  static String teamTranslucenceLogo(String abbr) {
    if (abbr.isEmpty) abbr = "NBA";
    String logo =
        "https://res.nba.cn/media/img/teams/playercard_teamlogos/${abbr}_logo.png";
    return logo;
  }

  static String playerHeadLogo(String playerId) {
    String logo =
        "https://res.nba.cn/media/img/players/head/260x190/$playerId.png";
    return logo;
  }

  static String votePlayLogo(String playerId) {
    return "https://res.nba.cn/media/img/players/silos/440x700/$playerId.png";
  }

  static String pendingTeamLogo =
      "https://res.nba.cn/media/img/teams/logo_unkown.png";

  static String playOffFinalLogo =
      "https://res.nba.cn/media/img/playoffs/finals.png";

  static String playOffPendingLogo =
      "https://res.nba.cn/media/img/playoffs/playoffs.png";
}
