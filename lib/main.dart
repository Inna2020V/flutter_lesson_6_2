import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    body: ButterfliesList(),
    appBar: AppBar(
      title: const Text('Butterflies'),
      centerTitle: true,
    ),
  )));
}

class ButterfliesList extends StatefulWidget {
  @override
  _ButterfliesListState createState() => _ButterfliesListState();
}

class _ButterfliesListState extends State<ButterfliesList> {
  final List<String> _butterflies = <String>[
    "Крапивница",
    "Павлиний глаз",
    "Капустница",
    "Траурница",
    "Переливница большая"
  ];
  final List<String> _description = <String>[
    "Красивая бабочка с кирпично-красными крыльями в крупных черных пятнах. По внешнему краю крыльев расположены маленькие голубые пятна",
    "Бабочка получила такое красивое название, засчет характерного рисунка на крыльях. На нижней части крыльев разместились округлые рисунки, напоминающие глаза.",
    "Крылья у бабочки белого цвета, по краям разбросанны черные пятнышки. Внутренняя часть салатного цвета, если бабочка будет сидеть на капусте со сложенными крыльями, заметить ее будет очень тяжело.",
    "Бабочка имеет жуткое название. Но на самом деле это очень милое насекомое. Ее так прозвали за крылья, которые имеют ярко-темный окрас.",
    "Очень красивая бабочка. Верхняя сторона крыльев черно-бурая, у самца с ярко-фиолетовым отливом, у самки темно-бурая без отлива с осветленным краем. Переливы создаются не синим пигментом, а структурными окрасками, отраженными светом."
  ];
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _butterflies.length,
            itemBuilder: (BuildContext context, int index) => ListTile(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              title: Text(_butterflies[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18)),
              selected: index == _selectedIndex,
              selectedTileColor: Colors.black12,
            ),
          ),
        ),
        const Text(
          'Описание:',
          textAlign: TextAlign.center,
        ),
        Container(
          height: 350,
          padding: const EdgeInsets.all(15),
          child: Text(
            _selectedIndex == -1 ? "Не выбрано" : _description[_selectedIndex],
            style: const TextStyle(fontSize: 18, color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
