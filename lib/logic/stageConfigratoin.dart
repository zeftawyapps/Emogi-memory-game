import 'dart:math';

import 'package:flutter/cupertino.dart';

class StageConfigs {
  List<String> imagesvaluesFirstStages = [
    "😀",
    "🤨",
    "😄",
    "🧐",
    "🤓",
    "😎",
    "🥶",
    "😱",
    "🥴",
    "😼",
    "😽",
    "☝️",
    "✋" ,"🇵🇸",
        "🤎",
    "❣️",
    "💙",
    "🧡",
    "🚆",
    "🚋",
    "🚓",
    "🚑",
    "🚒",
    "🚐",
    "🚚",
    "🏦",
    "🧀",
    "🍑",
    "🥭",
    "🍍",
    "🥥",
    "🥝",
    "🍅",
    "🍆",
    "🥑",
    "🌺",
    "🌵",
    "🎄",
    "🌲",
    "🌳",
    "🌝",
    "🌞",
    "🌜",
    "🌚",
    "🙉",
    "🐵",
    "😍",
    "🥰",
    "😘",
    "😗",
    "😢",
    "😭",
    "😋",
    "😛",
    "😡",
    "🗣️",
    "🧔",
    "♂️",
    "👵",
    "🧑",
    "🌾",
    "👩",
    "🧑",
    "🇪🇬",
    "🇮🇶",
    "🇸🇦",
    "🐶",
    "🦆",
    "🦖",
    "🦕",
    "🦒",
    "🦨",
    "🍄",
    "🌙",
    "🌎",
    "💧",
    "☂️",
    "🌊",
    "🍏",
    "🍎",
    "🥕",
    "🧆",
    "🍦",
    "🥂",
    "🍷",
    "🥃",
    "🍸",
    "⚽",
    "🛹",
    "🏇",
    "🏅",
    "♟️",
    "🎯",
    "🎮",
    "🎰",
    "🧩",
    "🚗",
    "🚡",
    "🏔️",
    "🕋",
    "🛤️",
    "🛣️",
    "⚒️",
    "🛠️",
    "🚛",
    "🚜",
    "🦽",
    "🦼",
    "🛴",
    "🚲",
    "🛩️",
    "🛰️",
    "🚀",
    "🏩",
    "🏨",
    "📡",
    "🔋",
    "🏮",
    "🎎",
    "📄",
    "📘",
    "📕",
    "📮",
    "📰",
    "🖍️",
    "🗂️",
    "🖋️",
    "✳️",
    "🈁",
    "📶",
    "↩️",
    "🇸🇩",
    "🇦🇪",
    "🇹🇷"
  ];
  List<String> imagesvaluesFirstStagesDouble = [
    "😀"
    "🤨",
    "😄"
    "🧐",
    "🤓"
    "😎",
    "🥶"
    "😱",
    "🥴"
    "😼",
    "😽"
    "☝️",
    "🇵🇸"
    "🤎",
    "❣️"
    "💙",
    "🧡"
    "🚆",
    "🚋"
    "🚓",
    "🚑"
    "🚒",
    "🚐"
    "🚚",
    "🏦"
    "🧀",
    "🍑"
    "🥭",
    "🍍"
    "🥥",
    "🥝"
    "🍅",
    "🍆"
    "🥑",
    "🌺"
    "🌵",
    "🎄"
    "🌲",
    "🌳"
    "🌝",
    "🌞"
    "🌜",
    "🌚"
    "🙉",
    "🐵"
    "😍",
    "🥰"
    "😘",
    "😗"
    "😢",
    "😭"
    "😋",
    "😛"
    "😡",
    "🗣️"
    "🧔",
    "♂️"
    "👵",
    "🧑"
    "🌾",
    "👩"
    "🧑",
    "🇪🇬""🤎",
    "🇮🇶""🤎",
    "🇸🇦""🤎",
    "🐶"
    "🦆",
    "🦖"
    "🦕",
    "🦒"
    "🦨",
    "🍄"
    "🌙",
    "🌎"
    "💧",
    "☂️"
    "🌊",
    "🍏"
    "🍎",
    "🥕"
    "🧆",
    "🍦"
    "🥂",
    "🍷"
    "🥃",
    "🍸"
    "⚽",
    "🛹"
    "🏇",
    "🏅"
    "♟️",
    "🎯"
    "🎮",
    "🎰"
    "🧩",
    "🚗"
    "🚡",
    "🏔️"
    "🕋",
    "🛤️"
    "🛣️",
    "⚒️"
    "🛠️",
    "🚛"
    "🚜",
    "🦽"
    "🦼",
    "🛴"
    "🚲",
    "🛩️"
    "🛰️",
    "🚀"
    "🏩",
    "🏨"
    "📡",
    "🔋"
    "🏮",
    "🎎"
    "📄",
    "📘"
    "📕",
    "📮"
    "📰",
    "🖍️"
    "🗂️",
    "🖋️"
    "✳️",
    "🈁"
    "📶"];
  List<String> imagesvaluesFlages = [
    '🇪🇬',
    '🇦🇺',
    '🇧🇳',
    '🇨🇮',
    '🇲🇩',
    '🇲🇽',
    '🇲🇾',
    '🇵🇬',
  '🇵🇸',
    '🇵🇭',
    '🇵🇰',
    '🇵🇱',
    '🇵🇲',
    '🇵🇷',
    '🇵🇳',
    '🇸🇬',
    '🇸🇪',
    '🇸🇩',
    '🇸🇨',
    '🇸🇧',
    '🇸🇦',
    '🇷🇼'
        '🇷🇺',
    '🇷🇸',
    '🇮🇳',
    '🇬🇷',
    '🇬🇸',
    '🇫🇲',
    '🇫🇴',
    '🇵🇱',
    '🇳🇫',
    '🇳🇬',
    '🇳🇮',
    '🇳🇱',
    '🇳🇴',
    '🇲🇶',
    '🇳🇵',
    '🇳🇷',
    "🇵🇸",
    "🇩🇿",
    "🇧🇷",
    "🇦🇫",
    "🇳🇪",
    "🇦🇿",
    "🇦🇷",
    "🇿🇦",
    "🇻🇳",
    "🇷🇴",
    "🇪🇦",
    "🇦🇷"
  ];
  List<String> imagevalueFaces = [
    "😀",
    "😃",
    "😄",
    "😁",
    "😆",
    "😅",
    "😂",
    "🤣",
    "☺️",
    "😊",
    "😇",
    "🙂",
    "🙃",
    "😉",
    "😌",
    "😍",
    "🥰",
    "😘",
    "😗",
    "😙",
    "😚",
    "😋",
    "😛",
    "😝",
    "😜",
    "🤪",
    "🤨",
    "🧐",
    "🤓",
    "😎",
    "🤩",
    "🥳",
    "😏",
    "😒",
    "😞",
    "😔",
    "😟",
    "😕",
    "🙁",
    "☹️",
    "😣",
    "😖",
    "😫",
    "😩",
    "🥺",
    "😢",
    "😭",
    "😤",
    "😠",
    "😡",
    "🤬",
    "🤯" "😳",
    "🥵",
    "🥶",
    "😱",
    "😨",
    "😰",
    "😥",
    "😓",
    "🤗",
    "🤔",
    "🤭",
    "🥱",
    "🤫",
    "🤥",
    "😶",
    "😐",
    "😑",
    "😬",
    "🙄",
    "😯",
    "😦",
    "😧",
    "😮",
    "😲",
    "😴",
    "🤤",
    "😪",
    "😵",
    "🤐",
    "🥴",
    "🤢",
    "🤮",
    "🤧",
    "😷",
    "🤒",
    "🤕",
    "🤑"
  ];

  List<String> imagevaluePlantsAndFoods = [
    "🍏",
    "🍎",
    "🍐",
    "🍊",
    "🍋",
    "🍌",
    "🍉",
    "🍇",
    "🍓",
    "🍈",
    "🍒"
    "🍑",
    "🥭",
    "🍍",
    "🥥",
    "🥝",
    "🍅",
    "🍆",
    "🥑",
    "🥦",
    "🧄",
    "🥕",
    "🌽",
    "🌶️",
    "🥒",
    "🥬",
    "🌵",
    "🎄",
    "🌲",
    "🌳",
    "🌴",
    "🌱",
    "🌿",
    "☘️",
    "🍀",
    "🍃",
    "🍂",
    "🍁",
    "🍃",
    "🍞",
    "🥖",
    "🥨",
    "🧀",
    "🥚",
    "🍳",
    "🧈",
    "🥞",
    "🧇",
    "🥓",
    "🥩",
    "🍗",
    "🍖",
    "🌭",
    "🍔",
    "🍟",
    "🍕",
    "🥪",
    "🥙",
    "🧆",
    "🌮",
    "🧃",
    "🧉",
    "🍵",
    "☕",
    "🍼",
    "🥛",
    "🍯",
    "🥜",
    "🌰",
    "🍪",
    "🍩",
    "🍿",
    "🍫",
    "🍬",
    "🍭",
    "🍮",
    "🎂",
    "🍰",
    "🧁",
    "🥧",
    "🍦",
    "🍨",
    "🍧",
    "🍡",
    "🥤",
    "🍶",
    "🍺",
    "🍻",
    "🥂",
    "🍷",
    "🥃",
    "🍸",
    "🍹",
    "🍾"
  ];
  List<String> imageValueAnimals = [
  "🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻", "🐯",'🦁','🐮','🐸','🐵','🙈','🙉',
  '🙊','🐒','🐔','🐧','🐦','🐤',
  '🐣','🐥','🦆','🦅','🦉','🦇','🐺','🐗','🐴',
  '🦄','🐝','🐛','🦋','🐌','🐞','🐜','🦟','🦗','🕷️','🕸️','🦂','🐢',
  '🐍','🦎','🦖','🦕','🐙','🦑','🦐','🦞','🦀','🐡','🐠',
  '🐟','🐬','🐳','🐋','🦈','🐊','🐅','🐆','🦓','🦍','🦧','🐘'
  '🦜','🦚','🦃','🐓','🐈','‍🐈','🐕','‍🦺','🦮','🐩','🐕','🦌','🐐'
  ,'🦙','🐑','🐏','🐖','🐎','🐄','🐂','🐃',
  '🦘','🦒','🐫','🐪','🦏','🦛','🦢','🦩','🕊️','🐇','🦝','🦨','🦡',
  '🦦','🦥','🐁','🐀','🐿️'
  ];
  List<String> imagevalueTransfares =[
  "🚗","🚕","🚙","🚌","🚎","🏎️","🚓","🚑","🚒","🚐","🚚","🚛","🚜","🦽","🦼",
  "🛴","🚲","🛵","🏍️","🛺","🚨","🚔","🚍","🚘",
  "✈️","🛫","🛬","🛩️","💺","🛰️","🛸","🚁","🛶","⛵","🚤","🛥️",
 "🚭","📵","🚱","🚳","🚯","🚷","🚖","🚡","🚠","🚟","🚃","🚋","🚞","🚝","🚄","🚅","🚈","🚂","🚆","🚇",
  "🚊","🚉" ,
  "🛳️","⛴️","🚢","⛽","🚧","🚦","🚥","🚏","🛣️","🛤️","⛩️",
 "🕋","🛕","🕌","🏛️","🏪","🏨","🏦","🏥","🏤","🏣","🏬","🏢","🏭","️🏚️","🏘️","🏡","🏠"
  ] ;
  List<String> imagevaluesigals=[
    "✅" , "❇️","✳️" , "❎" , "🌐" , "💠" , "Ⓜ️","🌀","💤","🏧","🚾","♿","🅿️","🈳","🈂️","🛂","🛃","🛄","🛅","🔅","🔆","〽️","⚠️","🚸","⛔","🛑","⭕","❌","🆘","🅾️","🆑","🆎","🅱️","🅰️","‼️","⁉️","❓","❗" ,

  "🚭","📵","🔞","🚱","🚳","🚯","🚷","❤️","🧡","💛","💚","💙","💜","🖤","🤎","🤍","☪️","☢️","🚹","🚺",
    "🚼","🚻" ,"🆕","🆒","🆙","🆗","🆖","🔠","🔡","🔤","ℹ️","🔣","🈁","📶","🎦","🚮", "#️⃣" ,"▶️","⏸️","⏯️","⏹️","⏺️","⏭️","⏮️",
    "⏩","⏪","⏫","⏬","◀️", "➡️","⬅️","⬆️","⬇️","↗️" ,"🔇","🔉","🔊","🔔","🔕","📣","📢","🗨️","👁️" ,"💬","💭","🕡","🕠","🕟","🕞","🕝","🕜","🕛","🕚","🕙","🕘","🕗","🕖","🕕","🕔","🕓","🕒","🕑","🕐","🕧","🕦","🕥","🕤","🕣","🕢","♠️","♣️","♥️","♦️"
        "↘️","↙️","↖️","↕️","↔️","↪️","↩️","⤴️","⤵️","🔀","🔁","🔂","🔄","🔃","🎵","🎶","➕","➖","➗","✖️","♾️","💲","💱","™️","©️","®️" ,"➰", "🔲","🔳","🔷","🔶","🔹","🔸","🔻","🔺"
  ];
List<LinearGradient> _lineargradien=[
  LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,

  colors: [
  Color(0xff76b5c0)  , Color(0xff66e9e7), Color(0xffb31d47)

  ],) ,
  LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,

    colors: [
      Color(0xff292e5b)  , Color(0xff17b9b6), Color(0xffb3381d)

    ],) ,
  LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,

    colors: [
      Color(0xff767ac0)  , Color(0xff6a66e9), Color(0xff110344)

    ],) ,
  LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,

    colors: [
      Color(0xffefa662)  , Color(0xffff9500), Color(0xff5b2903)

    ],) ,
  LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,

    colors: [
      Color(0xffa476c0)  , Color(0xff840886), Color(0xff400842)

    ],) ,

];
List<Color> _cardOfColors = [
  Color(0xff047a7a) ,
  Color(0xff787a04) ,
  Color(0xff902e53) ,
  Color(0xff1b4105) ,
  Color(0xff8f00fd)
];


  List<Color> _deilogColors = [
    Color(0xff022a2a) ,
    Color(0xff323302) ,
    Color(0xff360c1c) ,
    Color(0xff0a1703) ,
    Color(0xff1b022d)
  ];
  List<Color> _helpColors = [
    Color(0xff8ca609) ,
    Color(0xff8ca609) ,
    Color(0xff8ca609),
    Color(0xff8ca609),
    Color(0xff8ca609)
  ];

  List<Color> _lowAttempet = [
    Color(0x43a6090e) ,
    Color(0x43a6090e) ,
    Color(0x43a6090e) ,
    Color(0x43a6090e) ,
    Color(0x43a6090e) ,
  ];
  List<Color> _cardOnColors = [
    Color(0xedf3f7f7) ,
    Color(0xfff7f8c8) ,
    Color(0xffefa0bd) ,
    Color(0xffd1ecc0) ,
    Color(0xffdecbee)
  ];
  List<List<String>> imaglevels = [];

  List<String> imagValue = [];

  int cardNumberRond = 2;
  int cardValueRond = 2;

  int cardnum = 2;
  int gamelevle = 60;
  int lastno = 0;
  int defcult = 0;
  int imagelevelRandom = 0;
  int imageArray = 0;
  int colomesno = 0;
  LinearGradient? background ;
  Color? cardOfColor ;
  Color? cardOnColor ;
  Color? dailogcolor;
  Color? helpcardsColor;
  Color? LawAttempetCardsColor;

  StageConfigs(int gamelevle) {
    int cardNo;
    int culomno;
    int lastNo;
    this.gamelevle = gamelevle;
    List<String> imaglist;
    int stage = _setStagesConstrain();
_getBackgrund();
    switch (stage) {
      case 0: //3
        _setProparties(
            cardNo: 6,
            colomNo: _getCulomNo(6),
            lastNo: _getLasNo(imagesvaluesFirstStages.length),
            imagValue: imagesvaluesFirstStages,
            defculat: 0);
        break;
      case 1: //up 3
        cardNo = _getCardNo([ 8, 12]);
        culomno = _getCulomNo(cardNo);
        imaglist = _getimagLevel(1);
        lastNo = _getLasNo(imaglist.length);
        _setProparties(
            cardNo: cardNo,
            colomNo: culomno,
            lastNo: lastNo,
            imagValue: imaglist,
            defculat: 0);
        break;
      case 2: // up 20
        cardNo = _getCardNo([8, 12, 20]);
        culomno = _getCulomNo(cardNo);
        imaglist = _getimagLevel(3);
        lastNo = _getLasNo(imaglist.length);
        _setProparties(
            cardNo: cardNo,
            colomNo: culomno,
            lastNo: lastNo,
            imagValue: imaglist,
            defculat: 0);
        break;
      case 3: // up 50
        cardNo = _getCardNo([ 12, 20, 24]);
        culomno = _getCulomNo(cardNo);
        imaglist = _getimagLevel(4);
        lastNo = _getLasNo(imaglist.length);
        _setProparties(
            cardNo: cardNo,
            colomNo: culomno,
            lastNo: lastNo,
            imagValue: imaglist,
            defculat: 1);
        break;
      case 4:
        cardNo = _getCardNo([ 20, 24]);
        culomno = _getCulomNo(cardNo);
        imaglist = _getimagLevel(4);
        lastNo = _getLasNo(imaglist.length);
        _setProparties(
            cardNo: cardNo,
            colomNo: culomno,
            lastNo: lastNo,
            imagValue: imaglist,
            defculat: 3);
        break;
      case 5:
        cardNo = _getCardNo([  20, 24]);
        culomno = _getCulomNo(cardNo);
        imaglist = _getimagLevel(4);
        lastNo = _getLasNo(imaglist.length);
        _setProparties(
            cardNo: cardNo,
            colomNo: culomno,
            lastNo: lastNo,
            imagValue: imaglist,
            defculat: 4);
        break;

      case 6:
        cardNo = _getCardNo([  24]);
        culomno = _getCulomNo(cardNo);
        imaglist = _getimagLevel(4);
        lastNo = _getLasNo(imaglist.length);
        _setProparties(
            cardNo: cardNo,
            colomNo: culomno,
            lastNo: lastNo,
            imagValue: imaglist,
            defculat: 5);
        break;
    }
  }

  void _setProparties(
      {required int cardNo,
      required int colomNo,
      required int lastNo,
      required int defculat,
      required List<String> imagValue}) {
    this.cardnum = cardNo;
    this.colomesno = colomNo;
    this.lastno = lastNo;

    this.imagValue = imagValue;
  }

  int _setStagesConstrain() {
    if (gamelevle <= 3) {
      return 0;
    } else if (gamelevle <= 20 && gamelevle > 3) {
      return 1;
    } else if (gamelevle <= 50 && gamelevle > 20) {
      return 2;
    } else if (gamelevle <= 100 && gamelevle > 50) {
      return 3;
    } else if (gamelevle <= 200 && gamelevle > 100) {
      return 4;
    } else if (gamelevle <= 300 && gamelevle > 200) {
      return 5;
    } else {
      return 6;
    }
  }

  int _getCulomNo(int cardNo) {
    if (cardNo == 6 || cardNo == 8) {
      return 2;
    } else if (cardNo == 12) {
      return 3;
    } else {
      return 4;
    }
  }

  int _getCardNo(List<int> cardsNoList) {
    Random rands = new Random();
    int randomNumber = rands.nextInt(cardsNoList.length);

    return cardsNoList[randomNumber];
  }

  int _getLasNo(int length) {
    Random rands = new Random();
    int randomNumber = rands.nextInt(length);

    return randomNumber;
  }

  List<String> _getimagLevel(int i) {
    imaglevels = [
      imagesvaluesFirstStages,
      imagesvaluesFlages,
      imagevalueFaces,imageValueAnimals ,imagesvaluesFirstStagesDouble ,
      imagevaluePlantsAndFoods, imagevalueTransfares , imagevaluesigals
    ];
    if (i == 1) {
      return imaglevels[0];
    } else {
      int s;
      if (i == 2) {
        s = 3;
      } else if (i == 3) {
        s = 5;
      } else {
        s = imaglevels.length;
      }
      Random r = Random();
      int ir = r.nextInt(s);
      print("ir $ir");
      return imaglevels[ir];
    }
  }

void  _getBackgrund(){
  Random rands = new Random();
  int randomNumber = rands.nextInt(5);


background = _lineargradien[randomNumber];
cardOfColor = _cardOfColors[randomNumber];
cardOnColor = _cardOnColors[randomNumber];
dailogcolor = _deilogColors[randomNumber];
helpcardsColor = _helpColors[randomNumber] ;
  }
}
