//Importing Dependencies
import 'package:fluent_ui/fluent_ui.dart';
import 'package:window_manager/window_manager.dart';

//Importing packages
import 'fluent_home_page.dart';
import './DataBaseBackend/DataModels/playschool_data.model.dart';
import './DataBaseBackend/json_api.dart';
import './ScaffoldPages/View_Update/view_update_export.dart';

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
  initializeListOfWorkSheets();

  //debug
  List l = await returnJsonObjectList('generic.json');
  print(l);
  allStudents = l;

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
        brightness: Brightness.dark,
        accentColor: Colors.orange,
      ),
      home: const FluentHomePage(),
    );
  }
}
