import 'package:flutter/material.dart';

class OverviewExplanation extends StatelessWidget {
  const OverviewExplanation({super.key, required this.details});

  final String details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Overview of the System"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(children: [SizedBox(height: 30), Text(details)]),
    );
  }
}

class GoalExplanation extends StatelessWidget {
  const GoalExplanation({super.key, required this.details});

  final String details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Goal Explanation of the System"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(children: [SizedBox(height: 30), Text(details)]),
    );
  }
}

class FeaturesExplanation extends StatelessWidget {
  const FeaturesExplanation({super.key, required this.details});

  final String details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Features Included in the System"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(children: [SizedBox(height: 30), Text(details)]),
    );
  }
}

class MainExplanation extends StatelessWidget {
  const MainExplanation({super.key, required this.details});

  final String details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main feature of the System"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(children: [SizedBox(height: 30), Text(details)]),
    );
  }
}

class WorkingExplanation extends StatelessWidget {
  const WorkingExplanation({super.key, required this.details});

  final String details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("How does the system work?"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(children: [SizedBox(height: 30), Text(details)]),
    );
  }
}

class InputExplanation extends StatelessWidget {
  const InputExplanation({super.key, required this.details});

  final String details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs used in the System"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(children: [SizedBox(height: 30), Text(details)]),
    );
  }
}

class RecommendationExplanation extends StatelessWidget {
  const RecommendationExplanation({super.key, required this.details});

  final String details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recommendation of this system to users"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(children: [SizedBox(height: 30), Text(details)]),
    );
  }
}

class ChatTabExplanation extends StatelessWidget {
  const ChatTabExplanation({super.key, required this.details});

  final String details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Tab/Chat Assistant Tab Explanation"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(children: [SizedBox(height: 30), Text(details)]),
    );
  }
}

class DataTabExplanation extends StatelessWidget {
  const DataTabExplanation({super.key, required this.details});

  final String details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Tab/Data Tab Explanation"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(children: [SizedBox(height: 30), Text(details)]),
    );
  }
}

class SecurityExplanation extends StatelessWidget {
  const SecurityExplanation({super.key, required this.details});

  final String details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("System Security Explanation"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(children: [SizedBox(height: 30), Text(details)]),
    );
  }
}

class DesignExplanation extends StatelessWidget {
  const DesignExplanation({super.key, required this.details});

  final String details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("System Design Explanation"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(children: [SizedBox(height: 30), Text(details)]),
    );
  }
}

class FileTabExplanation extends StatelessWidget {
  const FileTabExplanation({super.key, required this.details});

  final String details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Tab/File Tab Explanation"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(children: [SizedBox(height: 30), Text(details)]),
    );
  }
}

class UnavailableTabExplanation extends StatelessWidget {
  const UnavailableTabExplanation({super.key, required this.details});

  final String details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fourth Tab Explanation"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(children: [SizedBox(height: 30), Text(details)]),
    );
  }
}

class SystemOutputExplanation extends StatelessWidget {
  const SystemOutputExplanation({super.key, required this.details});

  final String details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fourth Tab Explanation"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(children: [SizedBox(height: 30), Text(details)]),
    );
  }
}

class TheDisclaimer extends StatelessWidget {
  const TheDisclaimer({super.key, required this.details});

  final String details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fourth Tab Explanation"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(children: [SizedBox(height: 30), Text(details)]),
    );
  }
}

class ETheQuestions extends StatelessWidget {
  const ETheQuestions({super.key, required this.receivedQuestions});

  final List<String> receivedQuestions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Questions as Examples"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(
        children: [SizedBox(height: 30), Text(receivedQuestions.toString())],
      ),
    );
  }
}
