# Activitat 1.2 – Escriu la teva primera App en Flutter

**Alumna:** María Carolina Kaechele Smoly
**Curs:** FSE552026 – Desenvolupament d'aplicacions mòbils iOS i Android amb Flutter (CIFO La Violeta)

## Descripció
Aplicació Flutter que genera noms de persona a l'atzar i els mostra en una llista infinita: a mesura que l'usuari es desplaça, es generen nous noms.

## Fitxers principals
- `lib/main.dart` – punt d'entrada de l'app i tema visual
- `lib/people_list.dart` – pantalla principal amb la llista de noms

## Feina desenvolupada
- **Paquet extern:** `faker` (`flutter pub add faker`) per generar noms i cognoms aleatoris.
- **Widget amb estat:** `PeopleList` és un `StatefulWidget`; el seu `State` guarda la llista de noms i els favorits, i usa `setState()` per refrescar la pantalla.
- **Llista infinita:** `ListView.builder` sense `itemCount`; quan s'arriba al final, es generen 20 noms més.
- **Hot reload:** utilitzat durant el desenvolupament per veure els canvis sense reiniciar l'app.

## Tasques addicionals
- **Disseny personalitzat:** tema Material 3 amb color base lila, AppBar acolorida, avatars amb la inicial i tipografia ajustada.
- **Més widgets / pantalles:** cada nom es pot marcar com a favorit (icona de cor) i un botó de l'AppBar obre una segona pantalla amb els favorits.
- **Llibreria addicional:** `faker`.

## Com executar-la
```bash
flutter pub get
flutter run -d chrome
```
