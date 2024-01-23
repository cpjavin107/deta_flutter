import 'package:flutter/material.dart';
import 'package:deta/models/news_model.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../contants/pdf_view_page.dart';
import '../../res/colors/appcolors.dart';

// ignore_for_file: prefer_const_constructors

class Event_Images extends StatefulWidget{
  List<Images>? value;
  Event_Images({Key? key,  this.value}) : super(key : key );

  @override
  State<Event_Images> createState() => _Event_ImagesState(value!);
}
class _Event_ImagesState extends State<Event_Images> {
  List<Images> value;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  _Event_ImagesState(this.value);
  @override
  Widget build(BuildContext context) {
    return Scaffold(  appBar: AppBar(
      title: Text("Events & News"),
      elevation: 0.0,
      backgroundColor: AppColors.maroonColor,
      iconTheme: IconThemeData(color: Colors.white),
    ),
        body: Stack(
               fit: StackFit.expand,
                children:<Widget> [
                    Padding(
                         padding: const EdgeInsets.all(8.0),
                         child:  Center(
                                child: value != null ? ListView.builder(
                                       itemCount: value.length,
                                          itemBuilder: (context, index) {
                                              return value[index].fileType=="pdf"?Container(
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width,
                                                  child: PDFViewerScreen(pdfUrl: '${value[index].image}',)):
                                                Card(
                                               color: Colors.white,
                                                child: InkWell(
                                                      child: Column(
                                                        children: [
                                                          Image.network(value[index].image??""),
                                                         ],
                                                    ),
                                                ),
                                             );
                                       },
                                   ): CircularProgressIndicator(backgroundColor: Colors.white),
                               ),
                        )
                    ],

               )
         );

  }
}