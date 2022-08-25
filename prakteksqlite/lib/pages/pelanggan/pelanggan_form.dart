import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PelangganForm extends StatefulWidget {
  const PelangganForm({super.key});

  @override
  _PelangganFormState createState() => _PelangganFormState();
}

class _PelangganFormState extends State<PelangganForm> {
  late TextEditingController txtID, txtNama, txtTgllhr;
  String gender = '' , tglLhr = '';
  _PelangganFormState(){
    txtID = TextEditingController();
    txtNama = TextEditingController();
    txtTgllhr = TextEditingController();
  }

  Widget txtInputID()=>TextFormField(controller: txtID, readOnly: true,
  decoration: InputDecoration(labelText:'ID Pelanggan'),
  );

  Widget txtInputNama()=>TextFormField(controller: txtNama,
  decoration: InputDecoration(labelText:'Nama Pelanggan'),
  );

  Widget dropDownGender()=>DropdownButtonFormField(
  decoration: InputDecoration(labelText: 'Jenis Kelamin'),
  isExpanded: true,
  value: gender, onChanged: (g){gender = '$g';},
  items: [
    DropdownMenuItem(child: Text('Pilih Gender'), value: '',),
    DropdownMenuItem(child: Text('Laki-Laki'), value: 'L',),
    DropdownMenuItem(child: Text('Perempuan'), value: 'P',),
  ],
  );

  DateTime initTgllhr(){
    try{
      return DateFormat('yyyy-MM-dd').parse(txtTgllhr.value.text);
    }catch(e){}
    return DateTime.now();
  }

  Widget txtInputTgllhr()=>TextFormField(readOnly: true,
  decoration: InputDecoration(labelText:'Tanggal Lahir'),
  controller: txtTgllhr,
  onTap: ()async{
    final tgl = await showDatePicker(context: context, initialDate:initTgllhr(), firstDate: DateTime(1900), lastDate: DateTime.now());
  if(tgl != null) txtTgllhr.text= DateFormat('yyyy-MM-dd').format(tgl) ;
  },
  );

  Widget aksiSimpan()=>TextButton(onPressed:() {
  },
  child: Text('Simpan', style: TextStyle(color: Colors.white),),);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Pelanggan'),
      actions: [
        aksiSimpan()
      ],),
      body: Padding(padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          txtInputID(),
          txtInputNama(),
          dropDownGender(),
          txtInputTgllhr(),
        ],
      ), ),
    );
  }
}