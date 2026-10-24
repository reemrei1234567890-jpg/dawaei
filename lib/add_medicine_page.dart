import 'package:flutter/material.dart';
import 'medicine.dart';

class AddMedicinePage extends StatefulWidget {
  const AddMedicinePage({super.key});

  @override
  State<AddMedicinePage> createState() =>
      _AddMedicinePageState();
}

class _AddMedicinePageState
    extends State<AddMedicinePage> {

  final TextEditingController nameController =
      TextEditingController();

  Color selectedColor = Colors.red;

  String selectedCategory = 'ضغط الدم';

  TimeOfDay selectedTime =
      const TimeOfDay(hour: 8, minute: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إضافة دواء'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [

              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'اسم الدواء',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              ListTile(
                leading: const Icon(Icons.access_time),
                title: const Text('وقت الجرعة'),
                subtitle: Text(
                  selectedTime.format(context),
                ),
                trailing: ElevatedButton(
                  onPressed: () async {
                    final TimeOfDay? picked =
                        await showTimePicker(
                      context: context,
                      initialTime: selectedTime,
                    );

                    if (picked != null) {
                      setState(() {
                        selectedTime = picked;
                      });
                    }
                  },
                  child: const Text('اختيار الوقت'),
                ),
              ),

              const SizedBox(height: 20),

              DropdownButton<String>(
                value: selectedCategory,
                isExpanded: true,
                items: const [
                  DropdownMenuItem(
                    value: 'ضغط الدم',
                    child: Text('❤️ ضغط الدم'),
                  ),
                  DropdownMenuItem(
                    value: 'السكري',
                    child: Text('💉 السكري'),
                  ),
                  DropdownMenuItem(
                    value: 'مسيلات الدم',
                    child: Text('🩸 مسيلات الدم'),
                  ),
                  DropdownMenuItem(
                    value: 'فيتامينات',
                    child: Text('🍊 فيتامينات'),
                  ),
                  DropdownMenuItem(
                    value: 'القلب',
                    child: Text('❤️‍🩹 القلب'),
                  ),
                  DropdownMenuItem(
                    value: 'الأعصاب',
                    child: Text('🧠 الأعصاب'),
                  ),
                  DropdownMenuItem(
                    value: 'مضاد حيوي',
                    child: Text('💊 مضاد حيوي'),
                  ),
                  DropdownMenuItem(
                    value: 'أخرى',
                    child: Text('📦 أخرى'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
              ),

              const SizedBox(height: 20),

              DropdownButton<Color>(
                value: selectedColor,
                isExpanded: true,
                items: const [
                  DropdownMenuItem(
                    value: Colors.red,
                    child: Text('🔴 أحمر'),
                  ),
                  DropdownMenuItem(
                    value: Colors.green,
                    child: Text('🟢 أخضر'),
                  ),
                  DropdownMenuItem(
                    value: Colors.blue,
                    child: Text('🔵 أزرق'),
                  ),
                  DropdownMenuItem(
                    value: Colors.orange,
                    child: Text('🟠 برتقالي'),
                  ),
                  DropdownMenuItem(
                    value: Colors.yellow,
                    child: Text('🟡 أصفر'),
                  ),
                  DropdownMenuItem(
                    value: Colors.purple,
                    child: Text('🟣 بنفسجي'),
                  ),
                  DropdownMenuItem(
                    value: Colors.pink,
                    child: Text('🩷 وردي'),
                  ),
                  DropdownMenuItem(
                    value: Colors.teal,
                    child: Text('💚 تركواز'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedColor = value!;
                  });
                },
              ),

              const SizedBox(height: 25),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    Medicine(
                      name: nameController.text,
                      time: selectedTime.format(context),
                      color: selectedColor,
                      category: selectedCategory,
                    ),
                  );
                },
                child: const Text('حفظ'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}