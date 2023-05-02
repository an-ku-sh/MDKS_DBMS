//Importing Dependencies
import 'package:fluent_ui/fluent_ui.dart';
import 'package:window_manager/window_manager.dart';

//Importing Navigation Pages
import './ScaffoldPages/Home/mdks_home.dart';
import './ScaffoldPages/View_Update/view_update_export.dart';
import './ScaffoldPages/Create/create_append.dart';
import './ScaffoldPages/Financial/financial_records.dart';

class FluentHomePage extends StatefulWidget {
  const FluentHomePage({super.key});

  @override
  State<FluentHomePage> createState() => _FluentHomePageState();
}

//Mixin of  FluentHomePageState with WindowListener
class _FluentHomePageState extends State<FluentHomePage> with WindowListener {
  //Fields
  //Navigation Fields
  int _currentindex = 0;
  final viewKey = GlobalKey();

  //Overriding Windoow Manager Methods
  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void onWindowClose() async {
    bool isPreventClose = await windowManager.isPreventClose();
    if (isPreventClose) {
      showDialog(
        context: context,
        builder: (_) {
          return ContentDialog(
            title: const Text('confirm close'),
            content: const Text('Are?'),
            actions: [
              FilledButton(
                child: const Text('Yes'),
                onPressed: () {
                  Navigator.pop(context);
                  windowManager.destroy();
                },
              ),
              FilledButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      );
    }
    //super.onWindowClose();
  }

  //
  @override
  Widget build(BuildContext context) {
    return NavigationView(
      // appBar: const NavigationAppBar(),
      key: viewKey,
      pane: NavigationPane(
        selected: _currentindex,
        onChanged: (i) => setState(
          () {
            _currentindex = i;
          },
        ),
        displayMode: PaneDisplayMode.compact,
        items: [
          PaneItem(
              icon: const Icon(FluentIcons.home_solid),
              title: const Text('MDKS Home')),
          PaneItem(
              icon: const Icon(FluentIcons.contact_info_mirrored),
              title: const Text('View Student Record')),
          PaneItem(
              icon: const Icon(FluentIcons.edit_contact),
              title: const Text('Create Student Record')),
          PaneItem(
              icon: const Icon(FluentIcons.circle_dollar),
              title: const Text('Financial Records')),
        ],
      ),
      content: NavigationBody(
        index: _currentindex,
        /* the no of children should match the no of Navigation Pane Items */
        children: const [
          MDKSHome(),
          ViewUpdateExport(),
          CreateAppend(),
          FinancialRecords(),
        ],
      ),
    );
  }
}
