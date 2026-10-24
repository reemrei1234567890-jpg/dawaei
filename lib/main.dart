import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'medicine.dart';
import 'add_medicine_page.dart';
import 'statistics_page.dart';
import 'about_page.dart';

void main() {
  runApp(const SmartMedicationApp());
}

class SmartMedicationApp extends StatelessWidget {
  const SmartMedicationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Medication',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor:
            const Color(0xFFF7F2FF),
      ),
      home: const MedicineHomePage(),
    );
  }
}

class MedicineHomePage extends StatefulWidget {
  const MedicineHomePage({super.key});

  @override
  State<MedicineHomePage> createState() =>
      _MedicineHomePageState();
}

class _MedicineHomePageState
    extends State<MedicineHomePage> {
  List<Medicine> medicines = [];

  @override
  void initState() {
    super.initState();
    loadMedicines();
  }

  Future<void> saveMedicines() async {
    final prefs =
        await SharedPreferences.getInstance();

    final medicineList = medicines
        .map((medicine) =>
            jsonEncode(medicine.toJson()))
        .toList();

    await prefs.setStringList(
      'medicines',
      medicineList,
    );
  }

  Future<void> loadMedicines() async {
    final prefs =
        await SharedPreferences.getInstance();

    final medicineList =
        prefs.getStringList('medicines');

    if (medicineList != null) {
      setState(() {
        medicines = medicineList
            .map(
              (item) => Medicine.fromJson(
                jsonDecode(item),
              ),
            )
            .toList();
      });
    }
  }

  double getAdherencePercentage() {
    if (medicines.isEmpty) {
      return 0;
    }

    int takenCount =
        medicines.where((m) => m.taken).length;

    return (takenCount / medicines.length) * 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          '💊 نظام الالتزام الدوائي الذكي',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const AboutPage(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.bar_chart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      StatisticsPage(
                    medicines: medicines,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(20),
                child: Image.asset(
                  'lib/assets/images/9.png',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Container(
              width: double.infinity,
              margin:
                  const EdgeInsets.all(16),
              padding:
                  const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient:
                    const LinearGradient(
                  colors: [
                    Color(0xFF7B1FA2),
                    Color(0xFF512DA8),
                  ],
                ),
                borderRadius:
                    BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.medication,
                    size: 50,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'نسبة الالتزام الدوائي',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${getAdherencePercentage().toStringAsFixed(0)}%',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 42,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            medicines.isEmpty
                ? const Padding(
                    padding:
                        EdgeInsets.all(20),
                    child: Text(
                      'لا توجد أدوية مضافة',
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(),
                    itemCount:
                        medicines.length,
                    itemBuilder:
                        (context, index) {
                      return Card(
                        elevation: 5,
                        margin:
                            const EdgeInsets.all(
                                8),
                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius
                                  .circular(15),
                        ),
                        child: ListTile(
                          leading:
                              CircleAvatar(
                            backgroundColor:
                                medicines[index]
                                    .color,
                          ),
                          title: Text(
                            medicines[index]
                                .name,
                          ),
                          subtitle: Text(
                            '${medicines[index].category}\n${medicines[index].time}',
                          ),
                          trailing:
                              ElevatedButton(
                            onPressed: () {
                              setState(() {
                                medicines[index]
                                    .taken = true;
                              });

                              saveMedicines();
                            },
                            child:
                                const Text('تم'),
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton(
        backgroundColor:
            Colors.deepPurple,
        child: const Icon(Icons.add),
        onPressed: () async {
          final Medicine? medicine =
              await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  const AddMedicinePage(),
            ),
          );

          if (medicine != null) {
            setState(() {
              medicines.add(medicine);
            });

            await saveMedicines();
          }
        },
      ),
    );
  }
}