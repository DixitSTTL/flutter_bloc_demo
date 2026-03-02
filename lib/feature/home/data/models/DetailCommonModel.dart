/// status : "success"
/// data : {"coin":{"uuid":"razxDUgYGNAdQ","symbol":"ETH","name":"Ethereum","description":"Ethereum is a global, public decentralized blockchain designed to run peer-to-peer smart contracts and decentralized applications.","color":"#3C3C3D","iconUrl":"https://cdn.coinranking.com/rk4RKHOuW/eth.svg","websiteUrl":"https://www.ethereum.org","links":[{"name":"www.ethereum.org","type":"website","url":"https://www.ethereum.org"},{"name":"etherscan.io","url":"https://etherscan.io/","type":"website"},{"name":"bitcointalk.org","url":"https://bitcointalk.org/index.php?topic=428589.0","type":"bitcointalk"},{"name":"ethereumproject","url":"https://facebook.com/ethereumproject","type":"facebook"},{"name":"ethereum","url":"https://github.com/ethereum","type":"github"},{"name":"ethereum","url":"https://www.reddit.com/r/ethereum/","type":"reddit"},{"name":"ethtrader","url":"https://www.reddit.com/r/ethtrader/","type":"reddit"},{"name":"@ethereum","url":"https://twitter.com/ethereum","type":"twitter"},{"name":"YouTube","url":"https://www.youtube.com/channel/UCNOfzGXD_C9YMYmnefmPH0g","type":"youtube"}],"supply":{"confirmed":true,"supplyAt":1772190007,"max":null,"total":"120692267.57150805","circulating":"120692267.57150805"},"numberOfMarkets":1074,"numberOfExchanges":87,"24hVolume":"17616542290","marketCap":"237742356883","fullyDilutedMarketCap":"237742356883","price":"1969.8226047650705","btcPrice":"0.02969961788814284","priceAt":1772192220,"change":"-4.60","rank":2,"sparkline":["2064.510385959206","2066.18255089397","2067.739279587565","2063.922836052651","2034.1157686923655","2017.7742089413252","1990.3278589120075","1993.3806194197964","2022.68454452994","2030.8260090516867","2027.6142009794014","2031.7741865627197","2029.094549577922","2021.6163849374436","2012.2616670475363","2026.2900488131775","2026.3431857923715","2050.9416945690396","2047.3555337344035","2040.0684599828535","2034.7137205341628","2035.9381088990945","2030.852547181674","1996.071640832736"],"allTimeHigh":{"price":"4945.666895424594","timestamp":1756062720},"coinrankingUrl":"https://coinranking.com/coin/razxDUgYGNAdQ+ethereum-eth","tier":1,"lowVolume":false,"listedAt":1438905600,"hasContent":true,"notices":null,"contractAddresses":[],"tags":["staking","layer-1","altcoin","halal","dino","deflationary","large-cap"],"isWrappedTrustless":false,"wrappedTo":null}}

class DetailCommonModel {
  DetailCommonModel({
      String? status, 
      DetailCommonData? data,}){
    _status = status;
    _data = data;
}

  DetailCommonModel.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? DetailCommonData.fromJson(json['data']) : null;
  }
  String? _status;
  DetailCommonData? _data;
DetailCommonModel copyWith({  String? status,
  DetailCommonData? data,
}) => DetailCommonModel(  status: status ?? _status,
  data: data ?? _data,
);
  String? get status => _status;
  DetailCommonData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// coin : {"uuid":"razxDUgYGNAdQ","symbol":"ETH","name":"Ethereum","description":"Ethereum is a global, public decentralized blockchain designed to run peer-to-peer smart contracts and decentralized applications.","color":"#3C3C3D","iconUrl":"https://cdn.coinranking.com/rk4RKHOuW/eth.svg","websiteUrl":"https://www.ethereum.org","links":[{"name":"www.ethereum.org","type":"website","url":"https://www.ethereum.org"},{"name":"etherscan.io","url":"https://etherscan.io/","type":"website"},{"name":"bitcointalk.org","url":"https://bitcointalk.org/index.php?topic=428589.0","type":"bitcointalk"},{"name":"ethereumproject","url":"https://facebook.com/ethereumproject","type":"facebook"},{"name":"ethereum","url":"https://github.com/ethereum","type":"github"},{"name":"ethereum","url":"https://www.reddit.com/r/ethereum/","type":"reddit"},{"name":"ethtrader","url":"https://www.reddit.com/r/ethtrader/","type":"reddit"},{"name":"@ethereum","url":"https://twitter.com/ethereum","type":"twitter"},{"name":"YouTube","url":"https://www.youtube.com/channel/UCNOfzGXD_C9YMYmnefmPH0g","type":"youtube"}],"supply":{"confirmed":true,"supplyAt":1772190007,"max":null,"total":"120692267.57150805","circulating":"120692267.57150805"},"numberOfMarkets":1074,"numberOfExchanges":87,"24hVolume":"17616542290","marketCap":"237742356883","fullyDilutedMarketCap":"237742356883","price":"1969.8226047650705","btcPrice":"0.02969961788814284","priceAt":1772192220,"change":"-4.60","rank":2,"sparkline":["2064.510385959206","2066.18255089397","2067.739279587565","2063.922836052651","2034.1157686923655","2017.7742089413252","1990.3278589120075","1993.3806194197964","2022.68454452994","2030.8260090516867","2027.6142009794014","2031.7741865627197","2029.094549577922","2021.6163849374436","2012.2616670475363","2026.2900488131775","2026.3431857923715","2050.9416945690396","2047.3555337344035","2040.0684599828535","2034.7137205341628","2035.9381088990945","2030.852547181674","1996.071640832736"],"allTimeHigh":{"price":"4945.666895424594","timestamp":1756062720},"coinrankingUrl":"https://coinranking.com/coin/razxDUgYGNAdQ+ethereum-eth","tier":1,"lowVolume":false,"listedAt":1438905600,"hasContent":true,"notices":null,"contractAddresses":[],"tags":["staking","layer-1","altcoin","halal","dino","deflationary","large-cap"],"isWrappedTrustless":false,"wrappedTo":null}

class DetailCommonData {
  DetailCommonData({
      Coin? coin,}){
    _coin = coin;
}

  DetailCommonData.fromJson(dynamic json) {
    _coin = json['coin'] != null ? Coin.fromJson(json['coin']) : null;
  }
  Coin? _coin;
DetailCommonData copyWith({  Coin? coin,
}) => DetailCommonData(  coin: coin ?? _coin,
);
  Coin? get coin => _coin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_coin != null) {
      map['coin'] = _coin?.toJson();
    }
    return map;
  }

}

/// uuid : "razxDUgYGNAdQ"
/// symbol : "ETH"
/// name : "Ethereum"
/// description : "Ethereum is a global, public decentralized blockchain designed to run peer-to-peer smart contracts and decentralized applications."
/// color : "#3C3C3D"
/// iconUrl : "https://cdn.coinranking.com/rk4RKHOuW/eth.svg"
/// websiteUrl : "https://www.ethereum.org"
/// links : [{"name":"www.ethereum.org","type":"website","url":"https://www.ethereum.org"},{"name":"etherscan.io","url":"https://etherscan.io/","type":"website"},{"name":"bitcointalk.org","url":"https://bitcointalk.org/index.php?topic=428589.0","type":"bitcointalk"},{"name":"ethereumproject","url":"https://facebook.com/ethereumproject","type":"facebook"},{"name":"ethereum","url":"https://github.com/ethereum","type":"github"},{"name":"ethereum","url":"https://www.reddit.com/r/ethereum/","type":"reddit"},{"name":"ethtrader","url":"https://www.reddit.com/r/ethtrader/","type":"reddit"},{"name":"@ethereum","url":"https://twitter.com/ethereum","type":"twitter"},{"name":"YouTube","url":"https://www.youtube.com/channel/UCNOfzGXD_C9YMYmnefmPH0g","type":"youtube"}]
/// supply : {"confirmed":true,"supplyAt":1772190007,"max":null,"total":"120692267.57150805","circulating":"120692267.57150805"}
/// numberOfMarkets : 1074
/// numberOfExchanges : 87
/// 24hVolume : "17616542290"
/// marketCap : "237742356883"
/// fullyDilutedMarketCap : "237742356883"
/// price : "1969.8226047650705"
/// btcPrice : "0.02969961788814284"
/// priceAt : 1772192220
/// change : "-4.60"
/// rank : 2
/// sparkline : ["2064.510385959206","2066.18255089397","2067.739279587565","2063.922836052651","2034.1157686923655","2017.7742089413252","1990.3278589120075","1993.3806194197964","2022.68454452994","2030.8260090516867","2027.6142009794014","2031.7741865627197","2029.094549577922","2021.6163849374436","2012.2616670475363","2026.2900488131775","2026.3431857923715","2050.9416945690396","2047.3555337344035","2040.0684599828535","2034.7137205341628","2035.9381088990945","2030.852547181674","1996.071640832736"]
/// allTimeHigh : {"price":"4945.666895424594","timestamp":1756062720}
/// coinrankingUrl : "https://coinranking.com/coin/razxDUgYGNAdQ+ethereum-eth"
/// tier : 1
/// lowVolume : false
/// listedAt : 1438905600
/// hasContent : true
/// notices : null
/// contractAddresses : []
/// tags : ["staking","layer-1","altcoin","halal","dino","deflationary","large-cap"]
/// isWrappedTrustless : false
/// wrappedTo : null

class Coin {
  Coin({
      String? uuid, 
      String? symbol, 
      String? name, 
      String? description, 
      String? color, 
      String? iconUrl, 
      String? websiteUrl, 
      List<Links>? links, 
      Supply? supply, 
      num? numberOfMarkets, 
      num? numberOfExchanges, 
      String? hVolume, 
      String? marketCap, 
      String? fullyDilutedMarketCap, 
      String? price, 
      String? btcPrice, 
      num? priceAt, 
      String? change, 
      num? rank, 
      List<String>? sparkline, 
      AllTimeHigh? allTimeHigh, 
      String? coinrankingUrl, 
      num? tier, 
      bool? lowVolume, 
      num? listedAt, 
      bool? hasContent, 
      dynamic notices, 
      List<dynamic>? contractAddresses, 
      List<String>? tags, 
      bool? isWrappedTrustless, 
      dynamic wrappedTo,}){
    _uuid = uuid;
    _symbol = symbol;
    _name = name;
    _description = description;
    _color = color;
    _iconUrl = iconUrl;
    _websiteUrl = websiteUrl;
    _links = links;
    _supply = supply;
    _numberOfMarkets = numberOfMarkets;
    _numberOfExchanges = numberOfExchanges;
    _hVolume = hVolume;
    _marketCap = marketCap;
    _fullyDilutedMarketCap = fullyDilutedMarketCap;
    _price = price;
    _btcPrice = btcPrice;
    _priceAt = priceAt;
    _change = change;
    _rank = rank;
    _sparkline = sparkline;
    _allTimeHigh = allTimeHigh;
    _coinrankingUrl = coinrankingUrl;
    _tier = tier;
    _lowVolume = lowVolume;
    _listedAt = listedAt;
    _hasContent = hasContent;
    _notices = notices;
    // _contractAddresses = contractAddresses;
    _tags = tags;
    _isWrappedTrustless = isWrappedTrustless;
    _wrappedTo = wrappedTo;
}

  Coin.fromJson(dynamic json) {
    _uuid = json['uuid'];
    _symbol = json['symbol'];
    _name = json['name'];
    _description = json['description'];
    _color = json['color'];
    _iconUrl = json['iconUrl'];
    _websiteUrl = json['websiteUrl'];
    if (json['links'] != null) {
      _links = [];
      json['links'].forEach((v) {
        _links?.add(Links.fromJson(v));
      });
    }
    _supply = json['supply'] != null ? Supply.fromJson(json['supply']) : null;
    _numberOfMarkets = json['numberOfMarkets'];
    _numberOfExchanges = json['numberOfExchanges'];
    _hVolume = json['24hVolume'];
    _marketCap = json['marketCap'];
    _fullyDilutedMarketCap = json['fullyDilutedMarketCap'];
    _price = json['price'];
    _btcPrice = json['btcPrice'];
    _priceAt = json['priceAt'];
    _change = json['change'];
    _rank = json['rank'];
    _sparkline = json['sparkline'] != null ? json['sparkline'].cast<String>() : [];
    _allTimeHigh = json['allTimeHigh'] != null ? AllTimeHigh.fromJson(json['allTimeHigh']) : null;
    _coinrankingUrl = json['coinrankingUrl'];
    _tier = json['tier'];
    _lowVolume = json['lowVolume'];
    _listedAt = json['listedAt'];
    _hasContent = json['hasContent'];
    _notices = json['notices'];
    /*if (json['contractAddresses'] != null) {
      _contractAddresses = [];
      json['contractAddresses'].forEach((v) {
        _contractAddresses?.add(Dynamic.fromJson(v));
      });
    }*/
    _tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    _isWrappedTrustless = json['isWrappedTrustless'];
    _wrappedTo = json['wrappedTo'];
  }
  String? _uuid;
  String? _symbol;
  String? _name;
  String? _description;
  String? _color;
  String? _iconUrl;
  String? _websiteUrl;
  List<Links>? _links;
  Supply? _supply;
  num? _numberOfMarkets;
  num? _numberOfExchanges;
  String? _hVolume;
  String? _marketCap;
  String? _fullyDilutedMarketCap;
  String? _price;
  String? _btcPrice;
  num? _priceAt;
  String? _change;
  num? _rank;
  List<String>? _sparkline;
  AllTimeHigh? _allTimeHigh;
  String? _coinrankingUrl;
  num? _tier;
  bool? _lowVolume;
  num? _listedAt;
  bool? _hasContent;
  dynamic _notices;
  // List<dynamic>? _contractAddresses;
  List<String>? _tags;
  bool? _isWrappedTrustless;
  dynamic _wrappedTo;
Coin copyWith({  String? uuid,
  String? symbol,
  String? name,
  String? description,
  String? color,
  String? iconUrl,
  String? websiteUrl,
  List<Links>? links,
  Supply? supply,
  num? numberOfMarkets,
  num? numberOfExchanges,
  String? hVolume,
  String? marketCap,
  String? fullyDilutedMarketCap,
  String? price,
  String? btcPrice,
  num? priceAt,
  String? change,
  num? rank,
  List<String>? sparkline,
  AllTimeHigh? allTimeHigh,
  String? coinrankingUrl,
  num? tier,
  bool? lowVolume,
  num? listedAt,
  bool? hasContent,
  dynamic notices,
  List<dynamic>? contractAddresses,
  List<String>? tags,
  bool? isWrappedTrustless,
  dynamic wrappedTo,
}) => Coin(  uuid: uuid ?? _uuid,
  symbol: symbol ?? _symbol,
  name: name ?? _name,
  description: description ?? _description,
  color: color ?? _color,
  iconUrl: iconUrl ?? _iconUrl,
  websiteUrl: websiteUrl ?? _websiteUrl,
  links: links ?? _links,
  supply: supply ?? _supply,
  numberOfMarkets: numberOfMarkets ?? _numberOfMarkets,
  numberOfExchanges: numberOfExchanges ?? _numberOfExchanges,
  hVolume: hVolume ?? _hVolume,
  marketCap: marketCap ?? _marketCap,
  fullyDilutedMarketCap: fullyDilutedMarketCap ?? _fullyDilutedMarketCap,
  price: price ?? _price,
  btcPrice: btcPrice ?? _btcPrice,
  priceAt: priceAt ?? _priceAt,
  change: change ?? _change,
  rank: rank ?? _rank,
  sparkline: sparkline ?? _sparkline,
  allTimeHigh: allTimeHigh ?? _allTimeHigh,
  coinrankingUrl: coinrankingUrl ?? _coinrankingUrl,
  tier: tier ?? _tier,
  lowVolume: lowVolume ?? _lowVolume,
  listedAt: listedAt ?? _listedAt,
  hasContent: hasContent ?? _hasContent,
  notices: notices ?? _notices,
  // contractAddresses: contractAddresses ?? _contractAddresses,
  tags: tags ?? _tags,
  isWrappedTrustless: isWrappedTrustless ?? _isWrappedTrustless,
  wrappedTo: wrappedTo ?? _wrappedTo,
);
  String? get uuid => _uuid;
  String? get symbol => _symbol;
  String? get name => _name;
  String? get description => _description;
  String? get color => _color;
  String? get iconUrl => _iconUrl;
  String? get websiteUrl => _websiteUrl;
  List<Links>? get links => _links;
  Supply? get supply => _supply;
  num? get numberOfMarkets => _numberOfMarkets;
  num? get numberOfExchanges => _numberOfExchanges;
  String? get hVolume => _hVolume;
  String? get marketCap => _marketCap;
  String? get fullyDilutedMarketCap => _fullyDilutedMarketCap;
  String? get price => _price;
  String? get btcPrice => _btcPrice;
  num? get priceAt => _priceAt;
  String? get change => _change;
  num? get rank => _rank;
  List<String>? get sparkline => _sparkline;
  AllTimeHigh? get allTimeHigh => _allTimeHigh;
  String? get coinrankingUrl => _coinrankingUrl;
  num? get tier => _tier;
  bool? get lowVolume => _lowVolume;
  num? get listedAt => _listedAt;
  bool? get hasContent => _hasContent;
  dynamic get notices => _notices;
  // List<dynamic>? get contractAddresses => _contractAddresses;
  List<String>? get tags => _tags;
  bool? get isWrappedTrustless => _isWrappedTrustless;
  dynamic get wrappedTo => _wrappedTo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = _uuid;
    map['symbol'] = _symbol;
    map['name'] = _name;
    map['description'] = _description;
    map['color'] = _color;
    map['iconUrl'] = _iconUrl;
    map['websiteUrl'] = _websiteUrl;
    if (_links != null) {
      map['links'] = _links?.map((v) => v.toJson()).toList();
    }
    if (_supply != null) {
      map['supply'] = _supply?.toJson();
    }
    map['numberOfMarkets'] = _numberOfMarkets;
    map['numberOfExchanges'] = _numberOfExchanges;
    map['24hVolume'] = _hVolume;
    map['marketCap'] = _marketCap;
    map['fullyDilutedMarketCap'] = _fullyDilutedMarketCap;
    map['price'] = _price;
    map['btcPrice'] = _btcPrice;
    map['priceAt'] = _priceAt;
    map['change'] = _change;
    map['rank'] = _rank;
    map['sparkline'] = _sparkline;
    if (_allTimeHigh != null) {
      map['allTimeHigh'] = _allTimeHigh?.toJson();
    }
    map['coinrankingUrl'] = _coinrankingUrl;
    map['tier'] = _tier;
    map['lowVolume'] = _lowVolume;
    map['listedAt'] = _listedAt;
    map['hasContent'] = _hasContent;
    map['notices'] = _notices;
    /*if (_contractAddresses != null) {
      map['contractAddresses'] = _contractAddresses?.map((v) => v.toJson()).toList();
    }*/
    map['tags'] = _tags;
    map['isWrappedTrustless'] = _isWrappedTrustless;
    map['wrappedTo'] = _wrappedTo;
    return map;
  }

}

/// price : "4945.666895424594"
/// timestamp : 1756062720

class AllTimeHigh {
  AllTimeHigh({
      String? price, 
      num? timestamp,}){
    _price = price;
    _timestamp = timestamp;
}

  AllTimeHigh.fromJson(dynamic json) {
    _price = json['price'];
    _timestamp = json['timestamp'];
  }
  String? _price;
  num? _timestamp;
AllTimeHigh copyWith({  String? price,
  num? timestamp,
}) => AllTimeHigh(  price: price ?? _price,
  timestamp: timestamp ?? _timestamp,
);
  String? get price => _price;
  num? get timestamp => _timestamp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['price'] = _price;
    map['timestamp'] = _timestamp;
    return map;
  }

}

/// confirmed : true
/// supplyAt : 1772190007
/// max : null
/// total : "120692267.57150805"
/// circulating : "120692267.57150805"

class Supply {
  Supply({
      bool? confirmed, 
      num? supplyAt, 
      dynamic max, 
      String? total, 
      String? circulating,}){
    _confirmed = confirmed;
    _supplyAt = supplyAt;
    _max = max;
    _total = total;
    _circulating = circulating;
}

  Supply.fromJson(dynamic json) {
    _confirmed = json['confirmed'];
    _supplyAt = json['supplyAt'];
    _max = json['max'];
    _total = json['total'];
    _circulating = json['circulating'];
  }
  bool? _confirmed;
  num? _supplyAt;
  dynamic _max;
  String? _total;
  String? _circulating;
Supply copyWith({  bool? confirmed,
  num? supplyAt,
  dynamic max,
  String? total,
  String? circulating,
}) => Supply(  confirmed: confirmed ?? _confirmed,
  supplyAt: supplyAt ?? _supplyAt,
  max: max ?? _max,
  total: total ?? _total,
  circulating: circulating ?? _circulating,
);
  bool? get confirmed => _confirmed;
  num? get supplyAt => _supplyAt;
  dynamic get max => _max;
  String? get total => _total;
  String? get circulating => _circulating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['confirmed'] = _confirmed;
    map['supplyAt'] = _supplyAt;
    map['max'] = _max;
    map['total'] = _total;
    map['circulating'] = _circulating;
    return map;
  }

}

/// name : "www.ethereum.org"
/// type : "website"
/// url : "https://www.ethereum.org"

class Links {
  Links({
      String? name, 
      String? type, 
      String? url,}){
    _name = name;
    _type = type;
    _url = url;
}

  Links.fromJson(dynamic json) {
    _name = json['name'];
    _type = json['type'];
    _url = json['url'];
  }
  String? _name;
  String? _type;
  String? _url;
Links copyWith({  String? name,
  String? type,
  String? url,
}) => Links(  name: name ?? _name,
  type: type ?? _type,
  url: url ?? _url,
);
  String? get name => _name;
  String? get type => _type;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['type'] = _type;
    map['url'] = _url;
    return map;
  }

}