import 'package:flutter/material.dart';

void main() {
  runApp(const HoroscopeApp());
}

class HoroscopeApp extends StatelessWidget {
  const HoroscopeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horoscope App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ZodiacListScreen(),
    );
  }
}

class ZodiacListScreen extends StatelessWidget {
  const ZodiacListScreen({super.key});

  final List<Map<String, String>> zodiacSigns = const [
    {'name': 'Aries', 'date': 'March 21 - April 19', 'symbol': '♈'},
    {'name': 'Taurus', 'date': 'April 20 - May 20', 'symbol': '♉'},
    {'name': 'Gemini', 'date': 'May 21 - June 20', 'symbol': '♊'},
    {'name': 'Cancer', 'date': 'June 21 - July 22', 'symbol': '♋'},
    {'name': 'Leo', 'date': 'July 23 - August 22', 'symbol': '♌'},
    {'name': 'Virgo', 'date': 'August 23 - September 22', 'symbol': '♍'},
    {'name': 'Libra', 'date': 'September 23 - October 22', 'symbol': '♎'},
    {'name': 'Scorpio', 'date': 'October 23 - November 21', 'symbol': '♏'},
    {'name': 'Sagittarius', 'date': 'November 22 - December 21', 'symbol': '♐'},
    {'name': 'Capricorn', 'date': 'December 22 - January 19', 'symbol': '♑'},
    {'name': 'Aquarius', 'date': 'January 20 - February 18', 'symbol': '♒'},
    {'name': 'Pisces', 'date': 'February 19 - March 20', 'symbol': '♓'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horoscope'),
      ),
      body: ListView.builder(
        itemCount: zodiacSigns.length,
        itemBuilder: (context, index) {
          final sign = zodiacSigns[index];
          return ListTile(
            leading: Text(sign['symbol']!, style: const TextStyle(fontSize: 30)),
            title: Text(sign['name']!),
            subtitle: Text(sign['date']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HoroscopeDetailScreen(sign: sign),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class HoroscopeDetailScreen extends StatelessWidget {
  const HoroscopeDetailScreen({super.key, required this.sign});

  final Map<String, String> sign;

  // Mock horoscope data - in a real app, this would come from an API
  String getMockHoroscope(String signName) {
    const mockHoroscopes = {
      'Aries': 'Today brings new opportunities. Be bold and take action.',
      'Taurus': 'Focus on stability today. Good day for financial matters.',
      'Gemini': 'Communication is key. Expect interesting conversations.',
      'Cancer': 'Trust your intuition. Family matters may need attention.',
      'Leo': 'Your charisma shines. Time to lead and inspire others.',
      'Virgo': 'Pay attention to details. Organization will bring success.',
      'Libra': 'Seek balance in all things. Harmony is within reach.',
      'Scorpio': 'Deep emotions surface. Use them to transform.',
      'Sagittarius': 'Adventure calls. Embrace new experiences.',
      'Capricorn': 'Hard work pays off. Stay disciplined and focused.',
      'Aquarius': 'Innovation flows. Think outside the box.',
      'Pisces': 'Creativity is high. Follow your dreams.',
    };
    return mockHoroscopes[signName] ?? 'Horoscope not available.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${sign['name']} Horoscope'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sign['symbol']!,
              style: const TextStyle(fontSize: 50),
            ),
            const SizedBox(height: 16),
            Text(
              'Daily Horoscope for ${sign['name']}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Text(
              getMockHoroscope(sign['name']!),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}