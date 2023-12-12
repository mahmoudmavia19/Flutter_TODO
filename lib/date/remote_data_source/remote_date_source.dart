import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mycourse/models/user.dart' as model;
import 'package:mycourse/utils/endpoints.dart';

abstract class RemoteDateSource {
  Future<void> register(model.User user,String password);
  Future<model.User?> login(String email,String password);
}

class  ImplRemoteDateSource implements RemoteDateSource{
 final  FirebaseAuth _auth = FirebaseAuth.instance;
 final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<void> register(model.User user,password) async{
    _auth.createUserWithEmailAndPassword(email: user.email!, password: password).then((value){
      user.uid = value.user!.uid;
     _firestore.collection(FirebaseEndpoints.users)
         .doc(value.user!.uid)
         .set(user.toJson()) ;
    });
  }

  @override
  Future<model.User?> login(String email, String password) async{
    var response =   await  _auth.signInWithEmailAndPassword(email: email, password: password);
    if(response.user!=null){
      var result = await _firestore.collection(FirebaseEndpoints.users)
          .doc(response.user!.uid).get();
      return model.User.fromJson(result.data()!);
    }
    return null;
  }
}