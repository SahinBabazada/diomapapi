import 'package:diomap/models/user_model.dart';
import 'package:diomap/services/get_users.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
          future: getUsers(),
          builder: ((context, snapshot) {
            List<UserModel> users = snapshot.data!;
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          users[index].firstName!,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          users[index].lastName!,
                          overflow: TextOverflow.ellipsis,
                        ),
                        leading: CircleAvatar(
                          child: Image.network(users[index].image!),
                        ),
                        trailing: Text(
                            'lat: ${users[index].address!.coordinates!.lat},  long: ${users[index].address!.coordinates!.lng}'),
                      );
                    })
                : const Text('Melumatlar yuklenir');
          }),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
