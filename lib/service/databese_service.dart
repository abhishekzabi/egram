import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod {
  Future cheemeniAddBusDetails(Map<String, dynamic> chmnibusInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("CheemeniBusDetails")
        .doc(id)
        .set(chmnibusInfoMap);
  }
   Future cherupuzhaAddBusDetails(Map<String, dynamic> chpbusInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("CherupuzhaBusDetails")
        .doc(id)
        .set(chpbusInfoMap);
  }
  Future <Stream<QuerySnapshot>>getcheemenibusdetails()async{
    return await FirebaseFirestore.instance.collection("CheemeniBusDetails").snapshots();

  }
  Future <Stream<QuerySnapshot>>getchpbusdetails()async{
    return await FirebaseFirestore.instance.collection("CherupuzhaBusDetails").snapshots();

  }
  ////////////////////taxi
  Future autoDriverDetails(Map<String, dynamic> autoDriverInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("AutoDriverDetails")
        .doc(id)
        .set(autoDriverInfoMap);
  }
  Future magicirisDriverDetails(Map<String, dynamic> magicirisDriverInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("MagicirisDriverDetails")
        .doc(id)
        .set(magicirisDriverInfoMap);
  }
   Future taxicarDriverDetails(Map<String, dynamic> taxicarDriverInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("TaxiCarDriverDetails")
        .doc(id)
        .set(taxicarDriverInfoMap);
  }
  /////////////goods/pickup
  Future goodsDriverDetails(Map<String, dynamic> goodsDriverInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("GoodsDriverDetails")
        .doc(id)
        .set(goodsDriverInfoMap);
  }
   Future temboDriverDetails(Map<String, dynamic> temboDriverInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("TemboDriverDetails")
        .doc(id)
        .set(temboDriverInfoMap);
  }
  ///news
   // Add news details to Firestore
  Future addNewsDetails(Map<String, dynamic> newsData, String id) async {
    return await FirebaseFirestore.instance
        .collection("News")
        .doc(id)
        .set(newsData);
  }
  ///////////////store

  Future storeDetails(Map<String, dynamic> storeInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("StoreDetails")
        .doc(id)
        .set(storeInfoMap);
  }
  Future hardwareStoreDetails(Map<String, dynamic> hardwareStoreInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("HardwareStoreDetails")
        .doc(id)
        .set(hardwareStoreInfoMap);
  }
  Future TeaStallDetails(Map<String, dynamic>teaStallInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("TeaStallDetails")
        .doc(id)
        .set(teaStallInfoMap);
  }
   Future TextileDetails(Map<String, dynamic>textileInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("TextileDetails")
        .doc(id)
        .set(textileInfoMap);
  }
   Future hairSaloonDetails(Map<String, dynamic>hairsaloonInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("HairSaloonDetails")
        .doc(id)
        .set(hairsaloonInfoMap);
  }
     Future otherStoreDetails(Map<String, dynamic>otherStoreInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("OtherStoreDetails")
        .doc(id)
        .set(otherStoreInfoMap);
  }
  ///////feedback
   Future feedbackDetails(Map<String, dynamic>feedbackInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("FeedbackDetails")
        .doc(id)
        .set(feedbackInfoMap);
  }
}
