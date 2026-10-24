import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('حول المشروع'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(
              Icons.health_and_safety,
              size: 100,
              color: Colors.deepPurple,
            ),

            const SizedBox(height: 15),

            const Text(
              'نظام الالتزام الدوائي الذكي',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'إعداد: ريم عبدالله ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 25),

            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      '🎯 هدف المشروع',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'يهدف نظام الالتزام الدوائي الذكي إلى مساعدة المرضى على متابعة أدويتهم اليومية وتقليل نسيان الجرعات وتحسين الالتزام بالخطة العلاجية من خلال واجهة سهلة الاستخدام تقدم متابعة واضحة وإحصائيات مفيدة.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            Card(
              elevation: 5,
              color: Color(0xFFF3E5F5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      '✅ المميزات الحالية',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    SizedBox(height: 15),

                    ListTile(
                      leading: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                      title: Text('الترميز اللوني البصري '),
                    ),

                    ListTile(
                      leading: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                      title: Text('الحل الأقتصادي المتاح للجميع'),
                    ),

                    ListTile(
                      leading: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                      title: Text('نموذج اولي عملي مطور بأحدث التقنيات '),
                    ),

                    ListTile(
                      leading: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                      title: Text(' نسبة الالتزام الدوائي في صفحة الاحصائيات'),
                    ),

                    ListTile(
                      leading: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                      title: Text('بناء وتأسيس مرن بناءً على تجربة المستخدم'),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            Card(
              elevation: 5,
              color: Color(0xFFF3E5F5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      '🚀 الرؤية المستقبلية',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(
                      'يطمح المشروع إلى التحول إلى منصة صحية ذكية متكاملة تساعد المرضى على الالتزام بالعلاج وتحسين جودة الرعاية الصحية.',
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 20),

                    ListTile(
                      leading: Icon(
                        Icons.notifications,
                        color: Colors.deepPurple,
                      ),
                      title: Text('التوسع التقني وربط الأجهزة الطبية الحيوية '), 
                    ),

                    ListTile(
                      leading: Icon(
                        Icons.watch,
                        color: Colors.deepPurple,
                      ),
                      title: Text('التوسع اللغوي ودعم منصات أنظمة تشغيل متعددة'),
                    ),

                    ListTile(
                      leading: Icon(
                        Icons.family_restroom,
                        color: Colors.deepPurple,
                      ),
                      title: Text('تنبيه مقدم الرعاية'),
                    ),

                    ListTile(
                      leading: Icon(
                        Icons.analytics,
                        color: Colors.deepPurple,
                      ),
                      title: Text('دعم المنظومات الصحية والمستشفيات '),
                    ),

                    ListTile(
                      leading: Icon(
                        Icons.smart_toy,
                        color: Colors.deepPurple,
                      ),
                      title: Text(
                        'دمج الذكاء الاصطناعي لتحليل سلوك المريض ',
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            Card(
              color: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'يمثل هذا المشروع خطوة نحو بناء بيئة صحية رقمية أكثر ذكاءً تسهم في تحسين جودة الحياة وتعزيز التزام المرضى بخططهم العلاجية.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}