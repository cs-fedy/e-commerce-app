import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/user.dart';
import 'package:e_commerce/pages/home.dart';
import 'package:e_commerce/pages/landing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AppController extends GetxController {
  RxBool isLoggedIn = false.obs;
  late Rx<User?> firebaseUser;

  FirebaseAuth auth = FirebaseAuth.instance;
  final userFireStoreCollection = FirebaseFirestore.instance
      .collection('user')
      .withConverter<UserModel>(
        fromFirestore: (snapchot, _) => UserModel.fromJson(snapchot.data()!),
        toFirestore: (user, _) => user.toJson(),
      );

  final GoogleSignIn google = GoogleSignIn();

  @override
  void onInit() {
    super.onInit();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, handleUserChange);
  }

  void handleUserChange(User? user) {
    if (user == null) {
      isLoggedIn(false);
      Get.offAll(() => LandingScreen());
    } else {
      firebaseUser = Rx<User?>(user);
      isLoggedIn(true);
      Get.offAll(() => HomeScreen());
    }
  }

  Future<Map<String, dynamic>> signup(
      String email, String password, String fullName) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      await userFireStoreCollection.doc(user!.uid).set(
            UserModel(
              uid: user.uid,
              email: email,
              fullName: fullName,
            ),
          );

      return {"error": false, "user": user.uid};
    } on FirebaseAuthException catch (error) {
      return {
        "error": true,
        "code": error.code,
        "message": error.message,
      };
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;

      return {"error": false, "user": user?.uid};
    } on FirebaseAuthException catch (error) {
      return {
        "error": true,
        "code": error.code,
        "message": error.message,
      };
    }
  }

  Future<Map<String, dynamic>> googleLogin() async {
    GoogleSignInAccount? googleSignInAccount = await google.signIn();
    GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken,
    );

    try {
      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      final user = userCredential.user;
      final userId = user?.uid as String;
      final userEmail = user?.email as String;
      final fullName = user?.displayName as String;

      final fetchedUser = await userFireStoreCollection.doc(userId).get();
      if (!fetchedUser.exists) {
        userFireStoreCollection.doc(userId).set(
              UserModel(
                uid: userId,
                email: userEmail,
                fullName: fullName,
              ),
            );
      }
      return {"error": false, "user": user?.uid};
    } on FirebaseAuthException catch (error) {
      return {
        "error": true,
        "code": error.code,
        "message": error.message,
      };
    }
  }

  void logout() {
    auth.signOut();
  }
}
