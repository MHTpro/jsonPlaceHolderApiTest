import 'package:flutter/material.dart';
import 'package:my_api/api/my_api.dart';
import 'package:my_api/model/model.dart';

class ShowBody extends StatefulWidget {
  final int postsId;
  const ShowBody({
    super.key,
    required this.postsId,
  });

  @override
  State<ShowBody> createState() => _ShowBodyState();
}

class _ShowBodyState extends State<ShowBody> {
  Future<MainModel>? response;
  @override
  void initState() {
    response = getRequest(widget.postsId);
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
            child: FutureBuilder(
              future: response,
              builder:
                  (BuildContext context, AsyncSnapshot<MainModel> snapshot) {
                if (!(snapshot.hasData)) {
                  return const CircularProgressIndicator();
                }
                return response == null
                    ? const Center(
                        child: Text("Can't load data!"),
                      )
                    : Card(
                        color: Colors.black54,
                        child: Text(
                          "Body:\n${snapshot.data!.body}",
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}
