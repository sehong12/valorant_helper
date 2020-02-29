import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      // case CatList.routeName:
      //   return MaterialPageRoute(
      //       builder: (context) =>
      //           CatList(title: AppLocalizations.of(context).appTitle));
      // case CatDetail.routeName:
      //   // Validation of correct data type
      //   if (args is Cat) {
      //     return MaterialPageRoute(
      //       builder: (_) => CatDetail(
      //         selectedCat: args,
      //       ),
      //     );
      //   }
      //   // If args is not of the correct type, return an error page.
      //   // You can also throw an exception while in development.
      //   return _errorRoute();
      // case CatForm.routeName:
      //   if (args is Cat) {
      //     return MaterialPageRoute(
      //       builder: (_) => CatForm(targetCat: args, isEdit: true)
      //     );
      //   }
      //   return MaterialPageRoute(
      //     builder: (_) => CatForm(),
      //   );
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
