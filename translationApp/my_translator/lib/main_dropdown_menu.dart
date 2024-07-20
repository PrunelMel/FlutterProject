

enum MainLangLabel {
  french('French', 'fr'),
  english('English', 'en'),
  spanish('Spanish', 'es'),
  chinese('Chinese', 'zh-cn'),
  german('German', 'de');


  const MainLangLabel(this.name, this.code);
  final String name;
  final String code;

}

/*class MainDropdownMenu extends StatefulWidget{
  const MainDropdownMenu({super.key});

  @override
  State<MainDropdownMenu> createState() => _MainDropdownMenuState();
}

class _MainDropdownMenuState extends State<MainDropdownMenu> {

  final TextEditingController mainlangController = TextEditingController();
  MainLangLabel? langSelected;

  MainLangLabel? getLang(){
    return langSelected; 
  }
  
  @override
  Widget build(BuildContext context){
    return(DropdownMenu<MainLangLabel>(
      initialSelection: MainLangLabel.french,
      controller: mainlangController,
      textStyle: const TextStyle(color: Colors.white),
      requestFocusOnTap: true,
      label:const Text(""),
      onSelected: (MainLangLabel? lang){
        setState(() {
          langSelected = lang;
        });
      },
      dropdownMenuEntries: MainLangLabel.values.map<DropdownMenuEntry<MainLangLabel>>(
        (MainLangLabel lang){
          return DropdownMenuEntry<MainLangLabel>(
            value: lang,
            label: lang.name,
            enabled: true,
            
          );
        }).toList(),
      
    ));
  }
}
*/