import 'package:flutter/material.dart';

import 'package:thaicancerfree/constants.dart';

class PolicyPage extends StatefulWidget {
  const PolicyPage({super.key});

  @override
  State<PolicyPage> createState() => _PolicyPageState();
}

class _PolicyPageState extends State<PolicyPage> {
  String data = '''
นโยบายความเป็นส่วนตัวสำหรับลูกค้า
สถาบันมะเร็งแห่งชาติ ("เรา") ให้ความสำคัญอย่างยิ่งกับการคุ้มครองข้อมูลส่วนบุคคลของผู้ใช้แอปพลิเคชันทำแบบสอบถามเกี่ยวกับมะเร็งเต้านม ("แอปพลิเคชัน") นโยบายความเป็นส่วนตัวนี้จะแจ้งให้คุณทราบเกี่ยวกับวิธีการเก็บรวบรวม ใช้งาน และปกป้องข้อมูลส่วนบุคคลของคุณ โปรดอ่านอย่างละเอียดก่อนใช้งานแอปพลิเคชัน

1. ข้อมูลที่เราเก็บรวบรวม
เราเก็บรวบรวมข้อมูลดังต่อไปนี้จากการใช้งานแอปพลิเคชัน:
● ข้อมูลส่วนบุคคล: ชื่อ-นามสกุล, อายุ, เพศ, เบอร์โทรศัพท์, อีเมล ที่คุณได้ให้ไว้ในแบบสอบถาม
● ข้อมูลอื่น ๆ: ข้อมูลตำแหน่งทั่วไป (เมืองและประเทศ)

2. วัตถุประสงค์ในการใช้ข้อมูล
ข้อมูลของคุณจะถูกใช้เพื่อวัตถุประสงค์ดังต่อไปนี้:
● เพื่อการวิจัยและพัฒนาเกี่ยวกับการรักษามะเร็งเต้านม
● เพื่อการปรับปรุงประสบการณ์การใช้งานแอปพลิเคชัน
● เพื่อติดต่อคุณเกี่ยวกับคำถามเพิ่มเติมที่เกี่ยวข้องกับแบบสอบถาม
● เพื่อปฏิบัติตามกฎหมายหรือข้อกำหนดทางกฎหมาย

3. การเปิดเผยข้อมูล
เราจะไม่เปิดเผยข้อมูลส่วนบุคคลของคุณต่อบุคคลที่สาม ยกเว้นในกรณีดังต่อไปนี้:
● เมื่อได้รับความยินยอมจากคุณ
● การเปิดเผยตามกฎหมายต่อหน่วยงานของรัฐหรือเจ้าหน้าที่บังคับใช้กฎหมาย
● การให้บริการกับพันธมิตรหรือผู้ให้บริการที่เกี่ยวข้องในการดำเนินการตามวัตถุประสงค์ของเรา โดยพันธมิตรเหล่านั้นจะต้องปฏิบัติตามนโยบายความเป็นส่วนตัวเช่นเดียวกับเรา

4. การจัดเก็บและการปกป้องข้อมูล
เราจะจัดเก็บข้อมูลของคุณในระบบที่มีมาตรการรักษาความปลอดภัยที่ทันสมัย เช่น การเข้ารหัสข้อมูล และการจำกัดการเข้าถึงข้อมูลเพื่อป้องกันการเข้าถึงที่ไม่ได้รับอนุญาต

5. การเปลี่ยนแปลงนโยบายความเป็นส่วนตัว
เราขอสงวนสิทธิ์ในการแก้ไขนโยบายนี้เมื่อใดก็ได้ การเปลี่ยนแปลงใด ๆ จะมีผลบังคับใช้เมื่อเผยแพร่บนแอปพลิเคชัน โปรดตรวจสอบนโยบายนี้เป็นระยะเพื่อทราบถึงการเปลี่ยนแปลงล่าสุด

6. การติดต่อเรา
หากคุณมีคำถามหรือข้อสงสัยเกี่ยวกับนโยบายความเป็นส่วนตัวนี้ สามารถติดต่อเราได้ที่:

สถาบันมะเร็งแห่งชาติ
ที่อยู่: 268/1 ถนนพระราม 6 แขวงทุ่งพญาไท เขตราชเทวี กรุงเทพฯ 10400
โทรศัพท์: 02-202-6800, 02-2026888
อีเมล: ncihelp@nci.go.th, it.ncithailand@gmail.com

นโยบายนี้ถูกออกแบบมาเพื่อให้สอดคล้องกับกฎหมายและข้อบังคับที่เกี่ยวข้องในการคุ้มครองข้อมูลส่วนบุคคลของคุณอย่างเข้มงวด
''';

 
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.10),
        child: Container(
          height: size.height * 0.12,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [kContentColor3, kContentColor3],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(5, 0),
                blurRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: isPhone(context) ? 25 : 35,
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                      child: Text(
                        'นโยบายความเป็นส่วนตัว',
                        style: TextStyle(
                          color: kButtonNoColor,
                          fontSize: isPhone(context) ? 20 : 33,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                      width: size.width * 0.05,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                '$data',
                style: TextStyle(fontSize: isPhone(context) ? 18 : 22, fontWeight: FontWeight.w600),
              ),
              // Text(
              //   '$data1',
              //   style: TextStyle(fontSize: isPhone(context) ? 18 : 22, fontWeight: FontWeight.w600),
              // ),
              SizedBox(
                height: size.height * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
