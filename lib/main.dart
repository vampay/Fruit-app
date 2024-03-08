import 'package:flutter/material.dart';
import 'package:fruitapp/FruitDataModel.dart';
import 'package:fruitapp/FruitDetail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static List<String> fruitname = [
    'Apple',
    'Banana',
    'Mango',
    'Orange',
    'Pineapple'
  ];

  static List url = [
    'https://www.shutterstock.com/image-photo/red-apple-isolated-on-white-600nw-1727544364.jpg',
    'https://cdn.mos.cms.futurecdn.net/42E9as7NaTaAi4A6JcuFwG-1200-80.jpg',
    'https://cdn-cakfh.nitrocdn.com/uCvbbthIGuqozYBVHNiffOSAfPDdhkkl/assets/images/optimized/rev-aaacaf7/kaset.today/wp-content/uploads/2021/03/1-108.jpg',
    'https://5.imimg.com/data5/VN/YP/MY-33296037/orange-600x600-500x500.jpg',
    'https://5.imimg.com/data5/GJ/MD/MY-35442270/fresh-pineapple-500x500.jpg'
  ];

  static List<String> descriptions = [
    "แอปเปิ้ลเป็นผลไม้ที่มีให้พบได้ทั่วไปในหลายส่วนของโลก \nมันมีรสชาติหวานโดยเฉพาะและมีเนื้อที่เข้มข้น \nแอปเปิ้ลเป็นแหล่งที่ดีของใยอาหารและวิตามินซี \nมีสารต้านอนุมูลอิสระที่ช่วยป้องกันการเกิดภาวะเสื่อมสภาพของเซลล์ในร่างกายด้วย.",
    "กล้วยเป็นผลไม้ที่มีรสหวานและมีกลิ่นหอม \nมันเป็นแหล่งที่ดีของพอแสงเป็นกรดอะมิโนที่สามารถช่วยในกระบวนการผลิตฮอร์โมนเซโรโทนินในร่างกาย \nนอกจากนี้ กล้วยยังเป็นแหล่งที่ดีของแร่ธาตุเช่น พอแสง แคลเซียม และแมกนีเซียม.",
    "มะม่วงเป็นผลไม้ที่มีรสชาติหวานและเป็นเอกลักษณ์ \nมันเป็นแหล่งที่ดีของวิตามินเอ วิตามินซี และแอลคาโลย์ \nที่มีประโยชน์ต่อสุขภาพของผิวพรรณและระบบภูมิคุ้มกัน.",
    "ส้มเป็นผลไม้ที่มีรสชาติเปรี้ยวหวาน \nมันเป็นแหล่งที่ดีของวิตามินซี และก็มีแอนตี้ออกซิแดนต์ที่ช่วยให้ร่างกายสร้างและซ่อมแซมเนื้อเยื่อต่าง ๆ.",
    "สับปะรดมีรสชาติหวานเปรี้ยว \nมันเป็นแหล่งที่ดีของวิตามินซี และมีเอนไซม์ไบร์โอไนน์ที่ช่วยในกระบวนการย่อยอาหาร \nนอกจากนี้ สับปะรดยังเป็นแหล่งที่ดีของแมงกานีสซึ่งเป็นแร่ธาตุที่มีประโยชน์ต่อการสร้างกระดูกและฟันของเด็กและผู้ใหญ่."
  ];

  final List<FruitDataModel> Fruitdata = List.generate(
      fruitname.length,
      (index) => FruitDataModel(
            '${fruitname[index]}',
            '${url[index]}',
            '${fruitname[index]}  \n${descriptions[index]}',
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pass Data from ListView to next Screen'),
        ),
        body: ListView.builder(
            itemCount: Fruitdata.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(Fruitdata[index].name),
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.network(Fruitdata[index].ImageUrl),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FruitDetail(
                              fruitDataModel: Fruitdata[index],
                            )));
                  },
                ),
                color: Colors.white,
              );
            }));
  }
}

