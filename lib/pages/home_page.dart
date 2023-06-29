import 'package:flutter/material.dart';
import 'package:my_api/api/my_api.dart';
import 'package:my_api/model/model.dart';
import 'package:my_api/pages/body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MainModel?>? allResponse;

  @override
  void initState() {
    getAllRequest().then((value) => allResponse = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade200,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                const Text(
                  "List of jsonPlaceHolder(posts)",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                FutureBuilder(
                  future: getAllRequest(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<MainModel>> snapshot) {
                    if (!(snapshot.hasData)) {
                      return const CircularProgressIndicator();
                    }
                    return allResponse == null || allResponse!.isEmpty
                        ? const Center(
                            child: Text("Can't load data!"),
                          )
                        : SizedBox(
                            height: 660.0,
                            width: MediaQuery.sizeOf(context).width,
                            child: ListView.builder(
                              itemCount: allResponse!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return ShowBody(
                                              postsId: allResponse![index]!.id,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    child: Card(
                                      color: Colors.black,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Title:\n${allResponse![index]!.title}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            "Number:\n${allResponse![index]!.id}",
                                            style: const TextStyle(
                                              color: Colors.green,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
