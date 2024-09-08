import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class CouponCodesController extends GetxController {
  var couponCodes = [].obs;
  var isLoading = true.obs;

  Future<void> checkAppointmentsAndCreateCoupon() async {
    final expertSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('role', isEqualTo: "expert")
        .get();

    final parentId = FirebaseAuth.instance.currentUser!.uid;

    for (var expertDoc in expertSnapshot.docs) {
      final String expertId = expertDoc.id;
      final String expertName = expertDoc.data()['name'];

      // Get the last coupon document for this expert-parent pair
      final lastCouponSnapshot = await FirebaseFirestore.instance
          .collection('coupons')
          .where('expertId', isEqualTo: expertId)
          .where('parentId', isEqualTo: parentId)
          .orderBy('createdAt', descending: true)
          .limit(1)
          .get();

      DateTime? lastCouponDate;
      if (lastCouponSnapshot.docs.isNotEmpty) {
        lastCouponDate =
            (lastCouponSnapshot.docs.first.data()['createdAt'] as Timestamp)
                .toDate();
      }

      // Query appointments, considering only those after the last coupon date
      Query appointmentQuery = FirebaseFirestore.instance
          .collection('appointments')
          .where('parentId', isEqualTo: parentId)
          .where('expertId', isEqualTo: expertId)
          .where('status', isEqualTo: "Completed");

      if (lastCouponDate != null) {
        appointmentQuery = appointmentQuery.where('completedAt',
            isGreaterThan: lastCouponDate);
      }

      final appointmentSnapshot = await appointmentQuery.get();

      if (appointmentSnapshot.docs.length == 10) {
        // Generate a unique coupon code
        String couponCode = generateUniqueCouponCode();
        String id = const Uuid().v1();
        // Save the coupon in the 'coupons' collection
        await FirebaseFirestore.instance.collection('coupons').doc(id).set({
          'expertId': expertId,
          'expertName': expertName,
          'parentId': parentId,
          'code': couponCode,
          'status': "Active",
          'uid': id,
          'createdAt': FieldValue.serverTimestamp(),
          'appointmentsCount': appointmentSnapshot.docs.length,
          // Add any other relevant fields
        });

        print('New coupon created for expert $expertId and parent $parentId');
      }
    }
  }

  String generateUniqueCouponCode() {
    // Implement your coupon code generation logic here
    // This is a simple example, you might want to make it more sophisticated
    return 'COUPON-${DateTime.now().millisecondsSinceEpoch}';
  }
}
