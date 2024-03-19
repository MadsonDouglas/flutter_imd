import 'package:flutter/material.dart';

class FormAtv extends StatelessWidget {
  const FormAtv({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Aplication';
    return MaterialApp(
      title: title,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black54,
            title: const Text(title, style: TextStyle(color: Colors.white)),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.more_vert_sharp, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          body: ListView(children: [
            ListTile(
              title: const Text('Personal info',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
              onTap: () {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Firstname',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Lastname',
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Birthday',
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'MM/DD/AAAA',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12, 
                        ),
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Social Security',
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '###-##-###',
                        style: TextStyle(
                          color: Colors.grey, // Cor do texto
                          fontSize: 12, // Tamanho da fonte
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
            ListTile(
              title: const Text('Residence address',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
              onTap: () {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Address',
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'City',
                    ),
                  ),
                )),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'State',
                        suffixIcon: Icon(Icons.arrow_drop_down),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'ZIP Code',
                    ),
                  ),
                )),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Country',
                        suffixIcon: Icon(
                            Icons.arrow_drop_down), // Ícone ao lado direito
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ])),
    );
  }
}
