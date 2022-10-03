import 'package:flutter/material.dart';
import './view/filtersScreen.dart';
import './view/meal_detailsScreen.dart';
import './view/tabsScreen.dart';
import './view/categories_mealScreen.dart';
import './view/categries_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            subtitle1: const TextStyle(
              fontSize: 18,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
      ),
      //home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoriesMealScreen.routeName: (ctx) => CategoriesMealScreen(),
        MealDeatilScreen.routeName: (ctx) => MealDeatilScreen(),
        //CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen()
      },
      onGenerateRoute: (setting) {
        print(setting.arguments);
        // if(setting.name =='/meal-detail'){
        //   return ...;
        // }else if(setting.name =='/something-else'){
        //   return ...;
        // }
        //return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      onUnknownRoute: (setting) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
