import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class WalkStatsModel extends GetxController {
  double totalDistance = 0.0;
    int totalSteps = 0;
    Duration totalDuration = const Duration();
  Future<QueryDocumentSnapshot<Object?>?> getMostRecentWalk(String id) async {
    // Query the 'walks' collection and order by timestamp field in descending order
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('walks')
        .where('dogId', isEqualTo: id)
        .orderBy('timestamp', descending: true)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first;
    } else {
      return null;
    }
  }

  Future<QueryDocumentSnapshot<Object?>?> getTotalWalk(String id) async {
    // Query the 'walks' collection and order by timestamp field in descending order
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('walks')
        .where('dogId', isEqualTo: id)
        .get();

    

    for (var doc in querySnapshot.docs) {
      // Sum distance (assuming distance is stored as a string representing a number)
      if (doc['distance'] != null && doc['distance'] is String) {
        double distance = double.tryParse(doc['distance'])!;
        totalDistance += distance;
      }

      // Sum steps (assuming steps is stored as a string representing an integer)
      if (doc['steps'] != null && doc['steps'] is String) {
        int steps = int.tryParse(doc['steps'])!;
        totalSteps += steps;
      }

      // Sum duration (assuming duration is stored as a string in 'MM:SS' format)
      if (doc['duration'] != null && doc['duration'] is String) {
        List<String> durationParts = doc['duration'].split(':');
        if (durationParts.length == 2) {
          int minutes = int.tryParse(durationParts[0]) ?? 0;
          int seconds = int.tryParse(durationParts[1]) ?? 0;
          totalDuration += Duration(minutes: minutes, seconds: seconds);
        }
      }
    }

// Now you have the total values for distance, steps, and duration
    print('Total Distance: $totalDistance');
    print('Total Steps: $totalSteps');
    print(
        'Total Duration: ${totalDuration.inMinutes}:${totalDuration.inSeconds.remainder(60)}');

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first;
    } else {
      return null;
    }
  }
}
