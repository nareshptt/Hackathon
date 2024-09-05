import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final String productId;

  const ProductDetails({Key? key, required this.productId}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DocumentSnapshot? _productDoc;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchProductDetails();
  }

  _fetchProductDetails() async {
    try {
      final snapshot =
          await _firestore.collection('Products').doc(widget.productId).get();
      if (snapshot.exists) {
        setState(() {
          _productDoc = snapshot;
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        // Handle the case where the document does not exist
        print('Product not found');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Error fetching product details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _productDoc != null && _productDoc!.exists
              ? Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Display product image

                      SizedBox(height: 20),
                      // Display product name
                      Text(
                        _productDoc!['Name'] ?? 'Product Name',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      // Display product price
                      Text(
                        '\$${_productDoc!['Price'] ?? '0.00'}',
                        style: TextStyle(fontSize: 20, color: Colors.green),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${_productDoc!['Rating'] ?? '0'} units',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      // Display product quantity
                    ],
                  ),
                )
              : Center(child: Text('Product not found')),
    );
  }
}
