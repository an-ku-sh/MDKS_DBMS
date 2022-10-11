//Importing Dependencies
import 'package:fluent_ui/fluent_ui.dart';
import 'package:window_manager/window_manager.dart';

//Importing packages
import 'DataBaseBackend/DataModels/playschool_data.model.dart';
import 'fluent_home_page.dart';
import './DataBaseBackend/json_api.dart';

//Main
void main() async {
  //Main Body{}

  //Window Options
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  windowManager.waitUntilReadyToShow().then((_) async {
    await windowManager.setTitle('MDKS DataBase');
    await windowManager.setTitleBarStyle(TitleBarStyle.normal);
    await windowManager.setBackgroundColor(Colors.transparent);
    await windowManager.setSize(const Size(555, 345));
    await windowManager.setMinimumSize(const Size(555, 345));
    await windowManager.center();
    await windowManager.show();
    await windowManager.setSkipTaskbar(false);
  });

  // Initializing Json API
  initializeJsonAPI();

  //debug
  PlaySchoolDataModel playSchoolDataModel =
      PlaySchoolDataModel(StudentName: 'awd', FatherNamePhone: 'fawda');
  //Executing  MyFluentApp()
  runApp(const MyFluentApp());
}

class MyFluentApp extends StatelessWidget {
  const MyFluentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      debugShowCheckedModeBanner: false,
      title: 'MDKS DataBase',
      darkTheme: ThemeData(
        brightness: Brightness.light,
        accentColor: Colors.orange,
      ),
      home: const FluentHomePage(),
    );
  }
}
