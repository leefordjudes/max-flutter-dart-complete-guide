# flutter & dart complete guide by Maximilian Schwarzmüller

https://github.com/academind/flutter-complete-guide-course-resources

## 1. Simple Stateless Widget
### Widgets Used
    1. MaterialApp
    2. Scaffold
    3. AppBar
    4. Container
    5. Column
    6. SizedBox
    7. Text
    8. TextAlign

### Concepts
    1. Widget tree 
    2. double.infinity - in sizedbox, container
    3. simple style
    4. program entry (main)
    5. runApp
    6. Entry Widget (MyApp)
    7. width, height gap

## 2. Dice Roller - Simple Stateless & Stateful Widget
### Widgets Used
    1. Center
    2. Color, Colors 
    3. TextStyle
    4. FontStyle
    5. FontWeight
    6. Alignment
    7. BoxDecoration
    8. LinearGradient
    9. Image
    10. TextButton
    11. Random

### Concepts
    1. Constructors & initialization, super.key
    2. Named Constructors
    3. Positional parameter, Positional optional parameter in constructor
    4. Row & Column 
        - Alignment: MainAxisAlignment, CrossAxisAlignment
        - Size: MainAxisSize, CrossAxisSize
    5. Get image from assets, network
    6. difference b/w styleFrom & style
    7. state, setState
    8. simple function
    9. final, const
    10. simple component
    11. random number generation
    12. children, child,
    13. assets added in pubspec.yaml
    14. print string with interpolation: $var, ${var}

## 3. Quiz - Foundation ( Basic & Some Advanced Concepts )
### Widgets Used
    1. GoogleFonts
    2. OutlinedButton
    3. RoundedRectangleBorder & BorderRadius
    4. Icon & Icons
    5. SingleChildScrollView
    6. Expanded - restricting overflow above parent widget
    7. Padding
    8. EdgeInsets - all, symmetric, only
    9. Function
    10. ButtonStyle
    11. ElevatedButton
    12. MaterialStatePropertyAll

### Concepts
    1. using multiple functions
    2. parameterized function
    3. if condition
    4. List<String>, List<Map<String, Object>>, Map<String, Object>
    5. spliting widgets into simple components
    6. passing parameter & function to component from parent to child
    7. removing debug banner
    8. using google fonts
    9. accessing widget field & function from widget state
    10. named parameter in constructor
    11. for loop, array iteration using map, spread, toList
    12. button on pressed function
    13. onpressed: fun pointer, calling fun within wrapping fun
    14. passing parameter to function used in onpressed
    15. ternary operator
    16. button with icon
    17. datatype & type casting
    18. accessing single field in map using map['xx']
    19. class, array of class objects
    20. get
    21. model
    22. dependency adding -> pub.dev
    23. initState

### Packages
    1. google_fonts
    
## 4. Expense Tracker - Interactivity, Themeing
### Widgets Used
    1. ColorScheme
    2. ThemeMode
    3. Theme Widgets: 
        ThemeData, 
        CardTheme, 
        ElevatedButtonThemeData,
        AppBarTheme
    4. List<User Defined Widgets>
    5. DateTime, Duration
    6. ScaffoldMessenger
    7. SnackBar, SnackBarAction
    8. IconButton
    9. TextEditingController
    10. AlertDialog
    11. TextField, InputDecoration, TextInputType,
    12. DropdownButton, DropdownMenuItem
    13. ListView, Dismissible, ValueKey
    14. Card
    15. Spacer
    16. MediaQuery
    17. BoxDecoration 
        with
            BorderRadius,
            LinearGradient,
            Theme.of(context)
            Alignment
    18. FractionallySizedBox, (ref with Flexible)
    19. DecoratedBox
        with
            BoxDecoration
                with
                    BoxShape
                    BorderRadius.vertical
                    Radius.circular
                    Theme.of(context)

### Material dart Functions
    1. showModalBottomSheet
    2. showDatePicker
    3. showDialog 

### Concepts
    1. kColorScheme 
        - global color scheme - dark, light
        - textTheme, cardTheme, colorScheme, appBarTheme,   elevatedButtonTheme
        - seed color
        - brightness settings: Brightness.[dark,light]
        - changing theme setting with Theme.of(context)
    2. copyWith, styleFrom 
        - copy all settings from base and modify some properties.
    3. List of user defined widgets, ist methods
        - initialization, 
        - getting element index,
        - add, insert, remove, where, toList
    4. Models 
        - class, constructors, named constructors, initializations, get funs.
        - return String, double from get funs,
        - class variable initializations,
        - for-in loop
        - create shortcut for Utility functions
            Ex: 
                final formatter = DateFormat.yMd();
                const uuid = Uuid();
        - creating Map<enum, icondata>
    4. Using datetime.
        - getting current date time,
        - initializing with given year, month, day
    5. Using enums.
    6. overlays - showModalBottomSheet
        - widget environment context,
        - builder context,
        - scrolling modal content
    7. Navigation
        - move to back using Navigator.pop(context)
        - returning result to parent widget:
            ref: 
                1. https://stackoverflow.com/questions/51565524/flutter-onclosing-callback-for-showmodalbottomsheet
                2. https://api.flutter.dev/flutter/widgets/Navigator-class.html
        
    8. parsing text to double using tryParse
    9. states & override - state life cyle
        dispose, toString, initState, didUpdateWidget
        ref: 
            1. https://api.flutter.dev/flutter/widgets/State/initState.html
            2. https://api.flutter.dev/flutter/widgets/State-class.html
    10. building List view
    11. getting platform brightness using 
        MediaQuery.of(context).platformBrightness == Brightness.dark;

### Packages
    1. uuid
        Cryptographically strong random number generation on all platforms, Supports Stable UUID v1 to v5, Draft UUID v6 to v8.

    2. intl
        Provides internationalization and localization facilities, including message translation, plurals and genders, date/number formatting and parsing, and bidirectional text.

## 5. Expense Tracker - Responsive, Adaptive
### Widgets Used
    1. WidgetsFlutterBinding
    2. SystemChrome
    3. DeviceOrientation
    4. CupertinoAlertDialog
    5. LayoutBuilder

### Material dart Functions
    1.showCupertinoDialog

### Concepts
    1. lock orientation
    2. getting platform information
    3. getting device width using media query
    4. building responsive view using layout builder

## 6. Flutter Internals
### Widgets Used
    1. Align
    2. ValueKey, ObjectKey
    3. Checkbox
    
### Concepts
    1. difference between var, final, const
    2. understanding about 3 type of trees
        WidgetTree - ElementTree - RenderTree
    3. understanding about keys
    4. checkbox onchanged callback

## 7. Grid, Tab, Drawer - Navigation & Multi-Screen Apps
### Command
    flutter create  
                -e meals 
                --platforms android,windows 
                --org "com.cjtech"
### Widgets Used   
    1. MaterialPageRoute
    2. Navigator.of().push, pop, pushReplacement
    3. SwitchListTile
    4. PopScope
    5. (grid) GridView, SliverGridDelegateWithFixedCrossAxisCount, 
        its properties
    6. InkWell
    7. (tabs) BottomNavigationBar, BottomNavigationBarItem
    8. (drawer) Drawer, DrawerHeader, ListTile
    9. ListView, SingleChildScrollView
    10. Image, BoxFit, 
    11. FadeInImage, MemoryImage - transparent image, NetworkImage
    12. Positioned
    13. TextOverflow - trim very long text with ...
    14. Card, RoundedRectangleBorder, BorderRadius, Clip
    15. Stack
    16. Function  
    17. Icon, IconData
    18. IconButton

### Concepts
    1. Managing Screen Stacks
    2. Working with Tab Bars - Bottom navigation bar
    3. Using Side Drawers
    4. Align items using Grid
    5. Themeing: colorScheme, textTheme
    6. Custom & global - kConstants
    7. State managements without any external tools
    8. Passing function with parameters to widgets
    9. Returning values from widgets using Navigator functions
    10. AppBar actions
    11. returning widgets using for loop to children 
        [Widget collection]
    
### Packages
    1. transparent_image

## 8. State Management - using riverpod
### Widgets 
    1. ProviderScope, 
    2. Provider
    3. StateNotifier, StateNotifierProvider, [ClassName]Notifier
    4. ConsumerStatefulWidget, ConsumerState
    5. ConsumerWidget, WidgetRef,

### Concepts
    1. simple provider - meals provider
    2. state notifier provider & state notifier
    3. setting initial values to state notifier,
       state notifier provider with its notifier class 
    4. using state inside another state
    5. widget ref - read, watch
    6. calling functions within notifier class
    7. switching icons on click, appbar icons, appbar actions
    8. using popscope with state

### Packages
    1. flutter_riverpod - 2.5.1
    2. transparent_image - 2.0.1
    3. google_fonts - 6.2.1