import 'package:url_launcher/url_launcher.dart';


class UrlUtils {
  static Future<void> abrirUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir $url';
    }
  }
}
