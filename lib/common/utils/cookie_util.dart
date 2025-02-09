import 'package:bili_you/common/api/api_constants.dart';

import 'my_dio.dart';

class CookieUtils {
  static Future<String> getCsrf() async {
//从cookie中获取csrf需要的数据
    for (var i in (await MyDio.cookieManager.cookieJar
        .loadForRequest(Uri.parse(ApiConstants.bilibiliBase)))) {
      if (i.name == 'bili_jct') {
        return i.value;
      }
    }
    return '';
  }
}
