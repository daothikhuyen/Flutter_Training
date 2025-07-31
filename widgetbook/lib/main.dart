import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/l10n/app_localizations.dart';
import 'package:widgetbook_workspace/main.directories.g.dart';

// This file does not exist yet,
// it will be generated in the next step
// import 'main.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App(
  cloudAddonsConfigs: {
    'Vietnamese': [
      widgetbook.LocalizationAddonConfig('vi'), 
    ],
    'English': [
      widgetbook.LocalizationAddonConfig('en'), 
    ],
  },
)
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
       initialRoute: '?path=pages/detailpage/default',
      // The [directories] variable does not exist yet,
      // it will be generated in the next step
      directories: directories,
      addons: [
        // ViewportAddon([
        //   IosViewports.iPad
        // ]),
        DeviceFrameAddon(devices: [Devices.ios.iPhoneSE, Devices.ios.iPhone13, Devices.android.smallTablet]),
        InspectorAddon(),
        // GridAddon(100),
        AlignmentAddon(),
        ZoomAddon(),
        LocalizationAddon( 
          locales: AppLocalizations.supportedLocales, 
          localizationsDelegates: AppLocalizations.localizationsDelegates, 
        ), 
      ],
    );
  }
}
