import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        primarySwatch: Colors.green,
        secondaryHeaderColor: Colors.deepOrange,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(children: [
        Center(
          child: Image.asset('assets/images/logo.png'),
        ),
        const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              'ScarlabAi',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            )),
        const Padding(
          padding: EdgeInsets.only(top: 7.0),
          child: Text(
            'Automated the boring farm!',
            style: TextStyle(fontSize: 10, color: Colors.green),
          ),
        )
      ]),
      nextScreen: const Login(),
      splashIconSize: 160,
      duration: 3500,
    );
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            title: const Center(
              child: Text('Login'),
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Center(
                  child: SizedBox(
                      width: 200,
                      height: 150,
                      child: Image.asset('assets/images/farmer.png')),
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(right: 85, left: 85, top: 15, bottom: 0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter your email or username',
                  ),
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(right: 85, left: 85, top: 15, bottom: 0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter password',
                  ),
                  obscureText: true,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      right: 15, left: 15, top: 15, bottom: 0),
                  child: Container(
                    width: 330,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const Dashboard()));
                        },
                        child: const Text('Next')),
                  )),
              Padding(
                  padding: const EdgeInsets.only(
                      right: 15, left: 15, top: 15, bottom: 0),
                  child: Container(
                    width: 330,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.grey),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const Register()));
                        },
                        child: const Text('Click to create new user')),
                  )),
            ],
          ),
        ));
  }
}

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Create User'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "Sign up",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Create an Account,Its free",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          makeInput(label: "Username"),
                          makeInput(label: "Email"),
                          makeInput(label: "Password", obsureText: true),
                          makeInput(label: "Confirm Pasword", obsureText: true)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        width: 330,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const Register()));
                            },
                            child: const Text('Click to create new user')),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget makeInput({label, obsureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      const SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obsureText,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        ),
      ),
      const SizedBox(
        height: 30,
      )
    ],
  );
}

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            child: ListView(
          children: const [
            DrawerHeader(
              child: Text('My Drawer'),
            ),
          ],
        )),
        appBar: AppBar(
          elevation: 0,
          title: const Text('Dashboard'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const EditProfile()));
                },
                icon: const Icon(Icons.edit)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const PageView()));
          },
          child: const Icon(Icons.add),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(16.0),
          childAspectRatio: 8.0 / 9.0,
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                      aspectRatio: 18.0 / 11.0,
                      child: Image.asset('assets/images/money.png')),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                    child: Center(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              '\$4500',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Total Sales',
                              style: TextStyle(color: Colors.grey),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                      aspectRatio: 18.0 / 11.0,
                      child: Image.asset('assets/images/account.png')),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                    child: Center(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              '8',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'New Clients',
                              style: TextStyle(color: Colors.grey),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                      aspectRatio: 18.0 / 11.0,
                      child: Image.asset('assets/images/tractor.png')),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                    child: Center(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              'Machinery',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Manage',
                              style: TextStyle(color: Colors.grey),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                      aspectRatio: 18.0 / 11.0,
                      child: Image.asset('assets/images/weather.png')),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                    child: Center(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              '12\u00b0C',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Partly Cloud',
                              style: TextStyle(color: Colors.grey),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class PageView extends StatelessWidget {
  const PageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page View'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            title: const Text('\$4500',
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Total Sales'),
            trailing: Image.asset('assets/images/login.png'),
          ),
          ListTile(
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            title: const Text('350',
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('New Clients'),
            trailing: Image.asset('assets/images/login.png'),
          ),
          ListTile(
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            title: const Text('\$4500',
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Total Sales'),
            trailing: Image.asset('assets/images/login.png'),
          ),
          ListTile(
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            title: const Text('\$4500',
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Total Sales'),
            trailing: Image.asset('assets/images/login.png'),
          ),
          ListTile(
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            title: const Text('\$4500',
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Total Sales'),
            trailing: Image.asset('assets/images/login.png'),
          ),
          ListTile(
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            title: const Text('\$4500',
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Total Sales'),
            trailing: Image.asset('assets/images/login.png'),
          ),
          ListTile(
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            title: const Text('\$4500',
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Total Sales'),
            trailing: Image.asset('assets/images/login.png'),
          ),
          ListTile(
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            title: const Text('\$4500',
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Total Sales'),
            trailing: Image.asset('assets/images/login.png'),
          ),
        ],
      ),
    );
  }
}
