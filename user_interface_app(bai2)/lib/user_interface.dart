import 'package:flutter/material.dart';

class UserInterfaceScreent extends StatefulWidget {
  const UserInterfaceScreent({Key? key}) : super(key: key);

  @override
  State<UserInterfaceScreent> createState() => _UserInterfaceScreentState();
}

class _UserInterfaceScreentState extends State<UserInterfaceScreent> {

  String name = 'John Cena';
  bool darkMode = false;

  void changeName(){
    final key = GlobalKey<FormState>();
    TextEditingController controller = TextEditingController(text: name);
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text('Change name:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            content: Form(
              key: key,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: controller,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Please enter name!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: (){
                        setState(() {
                          name = controller.text;
                          Navigator.pop(context);
                        });
                      },
                      child: const Text('Save')
                  )
                ],
              ),
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    Color mainColor = darkMode ? Colors.black : Colors.white;
    Color characterColor = darkMode ? Colors.white : Colors.black;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
              child: Container(
                // height: 700,
                color:  mainColor,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 280),
                          child: Switch(
                              value: darkMode,
                              inactiveThumbColor: Colors.black,
                              activeColor: Colors.white,
                              onChanged: (bool newValue){
                                setState(() {
                                  darkMode = !darkMode;
                                });
                              }
                          ),
                        ),
                        const SizedBox(height: 40),
                        CircleAvatar(
                            radius: 100,
                            child: ClipOval(
                                child:Image.asset('assets/images/cena.jpg',  fit: BoxFit.cover))
                        ),
                        const SizedBox(height: 25),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(name, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color:darkMode ? Colors.white : Colors.black)),
                            const SizedBox(width: 15),
                            IconButton(
                                onPressed: changeName,
                                icon: Icon(Icons.edit_outlined, color: characterColor)
                            )
                          ],
                        ),
                        const SizedBox(height: 35),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text('Address', style: TextStyle(fontSize: 20, color: characterColor)),
                                leading: Icon(Icons.location_on, color: characterColor),
                                subtitle: Text('O Cho Dua, Dong Da, Hanoi, Vietnam', style: TextStyle(color: characterColor)),
                              ),
                              ListTile(
                                title: Text('Email',style: TextStyle(fontSize: 20, color: characterColor)),
                                leading: Icon(Icons.email, color: characterColor),
                                subtitle: Text('johncen@gmail.com', style: TextStyle(color: characterColor)),
                              ),
                              ListTile(
                                title: Text('Phone number',style: TextStyle(fontSize: 20, color: characterColor)),
                                leading: Icon(Icons.phone, color: characterColor),
                                subtitle: Text('+84 12345678', style: TextStyle(color: characterColor)),
                              ),
                            ],
                          ),

                        ),
                        const SizedBox(height: 150),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      );







  }
}
