import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';

part 'welcome_store.g.dart';

class WelcomeStore = _WelcomeStoreBase with _$WelcomeStore;

abstract class _WelcomeStoreBase with Store {
  @action
  Future<void> openYouTubeVideo(String videoUrl) async {
    final Uri url = Uri.parse(videoUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $videoUrl';
    }
  }

  @action
  void enterApp(Function onEnter) {
    onEnter();
  }
}
