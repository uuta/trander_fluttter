import '/import.dart';
import '/views/organisms/settings/setting_dialog_view.dart';
import '/views/organisms/settings/setting_direction_dialog_view.dart';
import '/views/organisms/settings/setting_mode_dialog_view.dart';

class SettingView extends HookConsumerWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth0State = ref.watch(auth0NotifierProvider);
    final locationState = ref.watch(locationNotifierProvider);

    final List _currentRange = <int>[
      locationState.settingData.minDistance,
      locationState.settingData.maxDistance
    ];

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
            child: SettingsList(
                lightTheme: const SettingsThemeData(
                    settingsListBackground: Colors.white),
                shrinkWrap: true,
                sections: [
              SettingsSection(
                title: Text('Location',
                    style: Theme.of(context).textTheme.headline3),
                tiles: [
                  SettingsTile(
                    title: const Text('Direction'),
                    description: Text(ConstsSetting.directionType.entries
                        .toList()
                        .where((e) =>
                            e.value == locationState.settingData.directionType)
                        .toList()[0]
                        .key),
                    trailing: const Icon(Icons.navigate_next),
                    leading: const Icon(Icons.location_on),
                    onPressed: (BuildContext context) {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) =>
                              const SettingDirectionDialogView());
                    },
                  ),
                  SettingsTile(
                    title: const Text('Range'),
                    description:
                        Text('${_currentRange[0]}km - ${_currentRange[1]}km'),
                    trailing: const Icon(Icons.navigate_next),
                    leading: const Icon(Icons.ramen_dining),
                    onPressed: (BuildContext context) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SettingRangePage()));
                    },
                  ),
                  SettingsTile(
                    title: const Text('Mode'),
                    description: Text(ConstsSetting.mode.entries
                        .toList()
                        .where((e) => e.value == locationState.settingMode)
                        .toList()[0]
                        .key),
                    trailing: const Icon(Icons.navigate_next),
                    leading: const Icon(Icons.source),
                    onPressed: (BuildContext context) {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) =>
                              const SettingModeDialogView());
                    },
                  ),
                ],
              ),
              SettingsSection(
                title: Text('Account',
                    style: Theme.of(context).textTheme.headline3),
                tiles: [
                  SettingsTile(
                    title: const Text('Name'),
                    description: Text(auth0State.data.name ?? '-'),
                    leading: const Icon(Icons.person),
                    onPressed: (BuildContext context) {},
                  ),
                  SettingsTile(
                    title: const Text('Email'),
                    description: Text(auth0State.data.email ?? '-'),
                    leading: const Icon(Icons.email),
                    onPressed: (BuildContext context) {},
                  ),
                  SettingsTile(
                    title: const Text('Plan'),
                    description: const Text('Free'),
                    trailing: const Icon(Icons.navigate_next),
                    leading: const Icon(Icons.price_change),
                    onPressed: (BuildContext context) => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PurchaseOfferPage())),
                  ),
                ],
              ),
              SettingsSection(
                title: Text('Logout',
                    style: Theme.of(context).textTheme.headline3),
                tiles: [
                  SettingsTile(
                    title: const Text('Logout'),
                    leading: const Icon(Icons.logout),
                    onPressed: (BuildContext context) {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) =>
                              const SettingDialogView());
                    },
                  ),
                ],
              )
            ])),
      ],
    ));
  }
}
