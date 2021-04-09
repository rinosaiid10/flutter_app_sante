
import 'package:esante/core_functions/serviceitems.dart';
import 'package:esante/ItemList//itemsList.dart';
import 'package:flutter/material.dart';
import 'package:honeywell_scanner/honeywell_scanner.dart';
import 'package:toast/toast.dart';

class scn extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _scn();
  }

}

class _scn extends State<scn> with WidgetsBindingObserver implements ScannerCallBack{
  HoneywellScanner honeywellScanner = HoneywellScanner();
  String scannedCode = 'Empty';
  bool scannerEnabled = false;
  bool scan1DFormats = true;
  bool scan2DFormats = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    honeywellScanner.setScannerCallBack(this);
    updateScanProperties();
  }

  updateScanProperties() {
    List<CodeFormat> codeFormats = [];
    if (scan1DFormats ?? false)
      codeFormats.addAll(CodeFormatUtils.ALL_1D_FORMATS);
    if (scan2DFormats ?? false)
      codeFormats.addAll(CodeFormatUtils.ALL_2D_FORMATS);

//    codeFormats.add(CodeFormat.AZTEC);
//    codeFormats.add(CodeFormat.CODABAR);
//    codeFormats.add(CodeFormat.CODE_39);
//    codeFormats.add(CodeFormat.CODE_93);
//    codeFormats.add(CodeFormat.CODE_128);
//    codeFormats.add(CodeFormat.DATA_MATRIX);
//    codeFormats.add(CodeFormat.EAN_8);
//    codeFormats.add(CodeFormat.EAN_13);
////    codeFormats.add(CodeFormat.ITF);
//    codeFormats.add(CodeFormat.MAXICODE);
//    codeFormats.add(CodeFormat.PDF_417);
//    codeFormats.add(CodeFormat.QR_CODE);
//    codeFormats.add(CodeFormat.RSS_14);
//    codeFormats.add(CodeFormat.RSS_EXPANDED);
//    codeFormats.add(CodeFormat.UPC_A);
//    codeFormats.add(CodeFormat.UPC_E);
////    codeFormats.add(CodeFormat.UPC_EAN_EXTENSION);

    honeywellScanner.setProperties(
        CodeFormatUtils.getAsPropertiesComplement(codeFormats));
  }

  // method pour scanner le QR code
  @override
  void onDecoded(String result) {
    print("res:"+result);
    setState(() {
      scannedCode = result;
    });
    getItems getitems=new getItems(id: int.parse(result));
    getitems.fetchItemInfo(context).then((value){
     if(value!=null){
       Toast.show("ok", context,duration:1);
       Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (BuildContext context){
         return itemsList(value);
       }));
     }else{
       Toast.show("Périphérie non repertorié dans notre base de données", context,duration: 3);
     }
    });
  }

  @override
  void onError(Exception error) {
    print("$error");
    Toast.show("$error", context,duration: 3);
    setState(() {
      scannedCode = error.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle:true,
        title: Text("SCANNER",textAlign: TextAlign.center,textScaleFactor:1,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Scanner State: ${scannerEnabled ? "Started" : "Stopped"}',
            style: TextStyle(color: scannerEnabled ? Colors.blue : Colors.red),),
          Divider(
            color: Colors.transparent,
          ),
          Text('Résultat : $scannedCode'),
          Divider(
            color: Colors.transparent,
          ),
          SwitchListTile(
            title: Text("Scan 1D Codes"),
            subtitle: Text("Exemples: Code-128, Code-39, Code-93, etc"),
            value: scan1DFormats,
            onChanged: (value) {
              scan1DFormats = value;
              updateScanProperties();
              setState(() {});
            },
          ),
          SwitchListTile(
            title: Text("Scan 2D Codes"),
            subtitle: Text("Exemples: QR, Data Matrix, Aztec, etc"),
            value: scan2DFormats,
            onChanged: (value) {
              scan2DFormats = value;
              updateScanProperties();
              setState(() {});
            },
          ),
          // ElevatedButton(
          //   child: Text("Start Scanner"),
          //   onPressed: () {
          //     honeywellScanner.startScanner();
          //     scannerEnabled = true;
          //     setState(() {});
          //   },
          // ),
          // Divider(
          //   color: Colors.transparent,
          // ),
          // ElevatedButton(
          //   child: Text("Stop Scanner"),
          //   onPressed: () {
          //     honeywellScanner.stopScanner();
          //     scannerEnabled = false;
          //     setState(() {});
          //   },
          // ),
        RaisedButton(
            child: Text("Stop Scanner"),
            onPressed: (){
              honeywellScanner.stopScanner();
              scannerEnabled = false;
              setState(() {});
        },
      ),
          Divider(
            color: Colors.transparent,
          ),
          RaisedButton(
            child: Text("Start Scanner"),
            onPressed: () {
              honeywellScanner.startScanner();
              scannerEnabled = true;
              setState(() {});
            },
          ),
        ],
      ),
    );


  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if(state == null) return;
    switch(state){
      case AppLifecycleState.resumed:
        if(honeywellScanner != null) honeywellScanner.resumeScanner();
        break;
      case AppLifecycleState.inactive:
        if(honeywellScanner != null) honeywellScanner.pauseScanner();
        break;
      case AppLifecycleState.paused://AppLifecycleState.paused is used as stopped state because deactivate() works more as a pause for lifecycle
        if(honeywellScanner != null) honeywellScanner.pauseScanner();
        break;
      case AppLifecycleState.detached:
        if(honeywellScanner != null) honeywellScanner.pauseScanner();
        break;
      default:
        break;
    }
  }

  @override
  void dispose() {
    if(honeywellScanner != null) honeywellScanner.stopScanner();
    super.dispose();
  }
}