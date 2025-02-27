import 'package:proyect_client/proyect_client.dart';
import 'package:flutter/material.dart';
import 'package:proyect_flutter/authentication/login/presentation/login.dart';
import 'package:proyect_flutter/home/presentation/home.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'common/services/route_generator.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';

// ------------------------ Global variables ------------------------- \\

late SessionManager sessionManager;
late Client client;

// ------------------------ MAIN ------------------------- \\

void main() async {
  await initClientAndManager();

  // GETS USER IF IT WAS ALREADY AUTHENTICATED.
  UsersRegistry? authUser = await getUserIfAuth();
  UserInfo? userInfo;
  if (authUser != null){
    userInfo = await getUserInfoIfAuth(authUser);
  }

  runApp(MyApp(user: authUser, userInfo: userInfo,));
}

// ------------------------ METHODS ------------------------- \\

Future<void> initClientAndManager() async{
  // Need to call this as we are using Flutter bindings before runApp is called.
  WidgetsFlutterBinding.ensureInitialized();

  // The android emulator does not have access to the localhost of the machine.
  // const ipAddress = '10.0.2.2'; // Android emulator ip for the host

  // On a real device replace the ipAddress with the IP address of your computer.
  const ipAddress = 'localhost';

  // Sets up a singleton client object that can be used to talk to the server from
  // anywhere in our app. The client is generated from your server code.
  // The client is set up to connect to a Serverpod running on a local server on
  // the default port. You will need to modify this to connect to staging or
  // production servers.
  client = Client(
    'http://$ipAddress:8080/',
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();

  // The session manager keeps track of the signed-in state of the user. You
  // can query it to see if the user is currently signed in and get information
  // about the user.
  sessionManager = SessionManager(
    caller: client.modules.auth,
  );
  await sessionManager.initialize();
}

Future<UsersRegistry?> getUserIfAuth() async {
    bool isAuth = sessionManager.isSignedIn;
    UsersRegistry? authUser;
    if (isAuth){
      // We get the user if it was authenticated before.
      authUser = await client.authenticated.getUserIfAuth();
    }
    return authUser;
  }

Future<UserInfo?> getUserInfoIfAuth(UsersRegistry user) async {
    bool isAuth = sessionManager.isSignedIn;
    UserInfo? userInfo;
    if (isAuth){
      // We get the user if it was authenticated before.
      userInfo = await client.usersRegistry.getUserInfoById(user.userInfoId);
    }
    return userInfo;
  }


// ------------------------ FLUTTER ------------------------- \\

class MyApp extends StatelessWidget {
  final UsersRegistry? user;
  final UserInfo? userInfo;
  
  const MyApp({super.key, required this.user, required this.userInfo});
  
  // THIS WIDGET IS THE ROOT OF YOUR APPLICATION.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sample App',
      // Test
      home: (user != null)? Home(client: client, user: user!, userInfo: userInfo!) :
                            Login(client: client,),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}


