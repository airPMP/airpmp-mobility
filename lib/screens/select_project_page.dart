import 'package:flutter/material.dart';
import 'package:job_card/models/project_model.dart';
import 'package:job_card/utilities/functions.dart';

class SelectProject extends StatefulWidget {
  @override
  _SelectProjectState createState() => _SelectProjectState();
}

class _SelectProjectState extends State<SelectProject> {
  String token;
  String companyID;
  List<MyProject> projects;

  bool isLoading = true;
  @override
  void initState() {
    getDataForProjectsPage();
    super.initState();
  }

  Future<void> getDataForProjectsPage() async {
    print('to work at start running.............');
    token = await getSavedToken();
    print('token getting done...');
    companyID = await getSavedCompanyID();
    print('got savedcompany id');
    print(companyID);
    projects = await getProjects(token, companyID);
    print('got projects');
    setState(() {
      isLoading = false;
    });
  }

  Widget listOfProjects() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () async {
            await saveProjectID(projects[index].id);
            Navigator.pushNamed(context, '/basic_frame');
          },
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    projects[index].name,
                    style: TextStyle(fontSize: 18),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black12),
                ),
              ),
              Divider(
                height: 1,
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 8, left: 15, right: 15, top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: SafeArea(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " Select your Project:",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: isLoading ? Container() : listOfProjects(),
            )
          ],
        ),
      ),
    );
  }
}
