import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: const Text("Mon Profil"),
        centerTitle: true,
      ),

      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          // --- La Card blanche derrière ---
          Positioned(
            top: 120,
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                padding: const EdgeInsets.only(top: 80, left: 20, right: 20, bottom: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      "Ryma Ben Salah",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Étudiante M2 – GL",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Divider(),
                    SizedBox(height: 20),
                    ProfileInfoRow(label: "Email", value: "ryma.ben-salah@etu.umontpellier.fr"),
                    ProfileInfoRow(label: "Ville", value: "Montpellier"),
                  ],
                ),
              ),
            ),
          ),

          // --- Avatar rond au-dessus de la card ---
          const Positioned(
            top: 30,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("/avatar.png"),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const ProfileInfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}
