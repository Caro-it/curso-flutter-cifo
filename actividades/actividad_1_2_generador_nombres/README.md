# Activitat 1.2 – Escriu la teva primera App en Flutter

**Alumna:** María Carolina Kaechele Smoly

## Descripció
Aplicació que genera noms de persona a l'atzar i els mostra en una llista infinita: a mesura que l'usuari es desplaça, se'n generen més.

## Fitxers principals
- `lib/main.dart` – punt d'entrada de l'app, títol i AppBar
- `lib/people_list.dart` – widget amb estat amb la llista de noms

## Feina desenvolupada
- **Paquet extern:** `random_name_generator`, afegit amb `flutter pub add`.
- **StatelessWidget i StatefulWidget:** `MyApp` és sense estat; `PeopleList` és amb estat i guarda la llista `_suggestions` al seu `State`.
- **Llista infinita:** amb `ListView.builder`, que genera 10 noms més quan s'arriba al final.
- **Hot reload vs hot restart:** el hot reload conserva l'estat (els noms no canvien); el hot restart el reinicia.

## Tasques addicionals
- **Noms catalans:** amb `Zone.catalonia`.
- **ListView.separated:** substitueix `Column` + `Divider`.
- **Colors alterns:** files parells i senars amb color de fons diferent.

## Com executar-la
Des d'aquesta carpeta: `flutter pub get` i després `flutter run -d chrome`.
