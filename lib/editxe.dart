import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class Suaxe extends StatefulWidget {
  final String bsx;
  final String gv;
  final String gr;
  final String nv;
  final String nr;
  final String tx;
  final String cmt;
  final String hx;
  final String td;
  const Suaxe({ Key? key, required this.bsx, required this.gv, required this.gr, required this.nv, required this.nr, required this.tx, required this.cmt, required this.hx, required this.td }) : super(key: key);

  @override
  _SuaxeState createState() => _SuaxeState();
}

class _SuaxeState extends State<Suaxe> {
  var fkey = GlobalKey<FormState>();
  DateTime dateVaoBen = DateTime.now();
  TimeOfDay timeVaoBen = TimeOfDay.now();
  DateTime dateRaBen = DateTime.now();
  TimeOfDay timeRaBen = TimeOfDay.now();

 
  _dateVaoBen(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.nv=="null"?dateVaoBen: DateFormat("dd/MM/yyyy").parse(widget.nv),
      initialEntryMode: DatePickerEntryMode.input,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
    );
    if (picked != null && picked != dateVaoBen) {
      setState(() {
        dateVaoBen = picked;
      });
    }
  }

  _timeVaoBen(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: widget.gv=="null"?timeVaoBen: TimeOfDay(
              hour: int.parse(widget.gv.split(":")[0]),
              minute: int.parse(widget.gv.split(":")[1])),
      initialEntryMode: TimePickerEntryMode.input,
      errorInvalidText: 'Enter time in valid range',
    );
    if (picked != null && picked != timeVaoBen) {
      setState(() {
        timeVaoBen = picked;
      });
    }
  }

  _dateRaBen(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:widget.nr=="null"?dateRaBen: DateFormat("dd/MM/yyyy").parse(widget.nr),
      initialEntryMode: DatePickerEntryMode.input,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
    );
    if (picked != null && picked != dateRaBen) {
      setState(() {
        dateRaBen = picked;
      });
    }
  }

  _timeRaBen(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: widget.gr=="null"?timeRaBen: TimeOfDay(
              hour: int.parse(widget.gr.split(":")[0]),
              minute: int.parse(widget.gr.split(":")[1])),
      initialEntryMode: TimePickerEntryMode.input,
      errorInvalidText: 'Enter time in valid range',
    );
    if (picked != null && picked != timeRaBen) {
      setState(() {
        timeRaBen = picked;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sửa thông tin xe'),
        actions: <Widget>[
          IconButton(
            onPressed: (){
              if (fkey.currentState!.validate()) {
              Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: const Text('Đã sửa thành công'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context, 'OK');
                              },
                              child: const Text('OK'))
                        ],
                      );
                    }
                  );
              }
            }, 
            icon: const Icon(Icons.check)
          )
        ],
      ),
            body: SingleChildScrollView(
        reverse: true,
        child: Form(
            key: fkey,
            child: Column(
              children: [
                TextFormField(
                  controller: TextEditingController(text: widget.bsx),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Biển số xe không được để trống";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "Vui Lòng nhập biển số xe",
                    labelText: "Biển số xe",
                  ),
                ),
                TextFormField(
                  controller: TextEditingController(text: widget.hx),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Hãng xe không được để trống";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "Vui Lòng nhập hãng xe",
                    labelText: "Hãng xe",
                  ),
                ),
                TextFormField(
                  controller: TextEditingController(text: widget.td),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Tuyến đường không được để trống";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "Vui Lòng nhập tuyến đường",
                    labelText: "Tuyến đường",
                  ),
                ),
                TextFormField(
                  controller: TextEditingController(text: widget.tx),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Tên tài xế không được để trống";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "Vui Lòng nhập tên tài xế",
                    labelText: "Tài Xế",
                  ),
                ),
                TextFormField(
                  controller: TextEditingController(text: widget.cmt),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Chứng minh thư không được để trống";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "Vui Lòng nhập số chứng minh thư",
                    labelText: "Chứng minh thư",
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      'Ngày vào bến: ',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      DateFormat('dd/MM/yyyy').format(dateVaoBen),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () => _dateVaoBen(context),
                      icon: const Icon(Icons.date_range),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Giờ vào bến: ',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      timeVaoBen.format(context),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () => _timeVaoBen(context),
                      icon: const Icon(Icons.watch),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Ngày ra bến: ',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      DateFormat('dd/MM/yyyy').format(dateRaBen),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () => _dateRaBen(context),
                      icon: const Icon(Icons.date_range),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Giờ ra bến: ',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      timeRaBen.format(context),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () => _timeRaBen(context),
                      icon: const Icon(Icons.watch),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}