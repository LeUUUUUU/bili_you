class AudioPlayItem {
  AudioPlayItem(
      {required this.urls,
      required this.quality,
      required this.bandWidth,
      required this.codecs});
  static AudioPlayItem get zero => AudioPlayItem(
      urls: [], quality: AudioQuality.unknown, bandWidth: 0, codecs: "");
  List<String> urls;
  AudioQuality quality;
  int bandWidth;
  String codecs;
}

enum AudioQuality {
  unknown,
  audio64k,
  audio132k,
  audio192k,
  dolby,
  hiRes,
}

extension AudioQualityCode on AudioQuality {
  static final List<int> _codeList = [
    -1,
    30216,
    30232,
    30280,
    30250,
    30251,
  ];

  static AudioQuality fromCode(int code) {
    var index = _codeList.indexOf(code);
    if (index == -1) {
      return AudioQuality.unknown;
    }
    return AudioQuality.values[index];
  }

  get code => _codeList[index];
}

extension AudioQualityDescription on AudioQuality {
  get description => ['未知', '64K', '132K', '192K', '杜比全景声', 'Hi-Res无损'][index];
}
