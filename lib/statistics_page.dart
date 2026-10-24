import 'package:flutter/material.dart';
import 'medicine.dart';

class StatisticsPage extends StatelessWidget {
  final List<Medicine> medicines;

  const StatisticsPage({
    super.key,
    required this.medicines,
  });

  @override
  Widget build(BuildContext context) {
    int totalMedicines = medicines.length;
    int takenMedicines =
        medicines.where((m) => m.taken).length;

    int notTakenMedicines =
        totalMedicines - takenMedicines;

    double adherence = totalMedicines == 0
        ? 0
        : (takenMedicines / totalMedicines) * 100;

    return Scaffold(
      appBar: AppBar(
        title: const Text('الإحصائيات'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: const Text('إجمالي الأدوية'),
                trailing: Text('$totalMedicines'),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('تم تناولها'),
                trailing: Text('$takenMedicines'),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('غير مؤكدة'),
                trailing: Text('$notTakenMedicines'),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              color: Colors.green.shade100,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      'نسبة الالتزام',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${adherence.toStringAsFixed(0)}%',
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}