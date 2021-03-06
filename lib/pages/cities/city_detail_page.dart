import '/import.dart';
import '/views/organisms/indexes/city_title_view.dart';
import '/views/molecules/buttons/mixed_three_button_view.dart';

class CityDetailPage extends HookConsumerWidget {
  const CityDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationState = ref.watch(locationNotifierProvider);

    return Scaffold(
        appBar: AppBar(
          title: const CityTitleView(),
        ),
        body: Container(
            padding:
                const EdgeInsets.only(right: 10, left: 10, top: 20, bottom: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'More Exploration',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const SizedBox(height: 20),
                  MixedThreeButton(
                    leftIcon: Image.asset("assets/images/utils/streetview.png",
                        width: 20),
                    leftText: 'Street View',
                    leftOnPressed: () => UrlService.launchUrl(
                        locationState.cityExploreState.streetview),
                    rightIcon: Image.asset("assets/images/utils/googlemap.png",
                        width: 20),
                    rightText: 'Google Map',
                    rightOnPressed: () => UrlService.launchUrl(
                        locationState.cityExploreState.googlemap),
                    bottomIcon: Image.asset("assets/images/utils/twitter.png",
                        width: 20),
                    bottomText: 'Share on Twitter',
                    bottomOnPressed: () => UrlService.launchUrl(
                        locationState.cityExploreState.twitter),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Details',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const SizedBox(height: 20),
                  SettingsList(
                      lightTheme: const SettingsThemeData(
                          settingsListBackground: Colors.white),
                      darkTheme: SettingsThemeData(
                          settingsListBackground: Colors.grey[900]),
                      shrinkWrap: true,
                      sections: [
                        SettingsSection(
                          tiles: [
                            SettingsTile(
                              title: const Text('Direction'),
                              trailing: Text(locationState.cityData.direction),
                              leading: const Icon(Icons.explore),
                            ),
                            SettingsTile(
                              title: const Text('Distance'),
                              trailing: Text(
                                  locationState.cityData.distance.toString() +
                                      ' km'),
                              leading: const Icon(Icons.map),
                            ),
                          ],
                        ),
                      ])
                ])));
  }
}
