# Pokedex App

Aplicación Flutter que consume [PokeAPI](https://pokeapi.co/)

## Requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) **3.44.1** o superior (canal stable).
- Un dispositivo físico o emulador configurado (`flutter doctor`)
- Para **iOS release**: macOS con Xcode instalado
- Para **Android release**: Android SDK configurado

## Configuración

1. Clona el repositorio e ingresa al proyecto:

```bash
git clone https://github.com/MarioSQuilantan/pokedex_app.git
cd pokedex_app
```

2. Crea el archivo `.env` en la raíz del proyecto, copia y pega lo siguiente:

```env
BASE_URL=https://pokeapi.co/api/v2
```

3. Instala dependencias:

```bash
flutter pub get
```

4. Genera los archivos de código (env, inyección de dependencias):

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

> **Nota:** `.env`, `lib/core/env/env.g.dart` e `injection.config.dart` no están en el repositorio. Debes crear el `.env` y ejecutar `build_runner` antes de compilar.

## Ejecutar en modo release iOS o Android

Lista dispositivos disponibles:

```bash
flutter devices
```

En un dispositivo o emulador conectado:

```bash
flutter run --release
```
