# Inglés Fácil 🇺🇸

🌐 **Pruébala en tu navegador:** https://extramega1-stack.github.io/ingles-facil/

MVP de aplicación **web** para aprender inglés desde cero, construida con **Flutter**.
Interfaz completamente en español; vocabulario, frases y ejercicios en inglés.
Pensada para principiantes absolutos que quieren llegar a un nivel conversacional
básico lo más rápido posible.

## Qué incluye

- **4 niveles progresivos**: Principiante → Básico → Intermedio → Conversacional.
  Cada nivel se desbloquea al completar todas las lecciones del anterior.
- **16 lecciones** (4 por nivel) con vocabulario de alta frecuencia, frases útiles
  y una nota de gramática esencial por lección.
- **80 ejercicios interactivos**: opción múltiple, completar espacios, emparejar
  palabras, escritura libre y comprensión auditiva.
- **Pronunciación/audio**: botón 🔊 en cada palabra y frase, y ejercicios de
  escucha (usa la síntesis de voz del navegador).
- **Seguimiento de progreso**: XP, racha de días, precisión, puntaje por lección
  y barras de progreso por nivel. Todo se guarda **localmente** con Hive
  (sin backend, sin cuenta).

## Requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) 3.35 o superior
- Navegador Chrome / Edge / Firefox

## Cómo ejecutarla

```bash
# 1. Entrar al proyecto
cd ingles-facil

# 2. Descargar dependencias
flutter pub get

# 3. Ejecutarla en el navegador
flutter run -d chrome
```

La app abrirá automáticamente una pestaña del navegador con la aplicación.

## Generar la versión web para publicar

```bash
flutter build web --release
```

Esto crea la carpeta `build/web/` con archivos estáticos listos para subir a
cualquier hosting (GitHub Pages, Netlify, Vercel, etc.). Para probarla en local:

```bash
cd build/web
python3 -m http.server 8000
# abrir http://localhost:8000
```

## Estructura del proyecto

```
lib/
├── main.dart                  # Arranque: Hive + servicios
├── app.dart                   # MaterialApp y tema
├── models/
│   └── models.dart            # Level, Lesson, Exercise, VocabItem, PhraseItem
├── data/
│   ├── curriculum.dart        # Agrega los 4 niveles + helpers
│   ├── nivel_1.dart           # Contenido: Principiante
│   ├── nivel_2.dart           # Contenido: Básico
│   ├── nivel_3.dart           # Contenido: Intermedio
│   └── nivel_4.dart           # Contenido: Conversacional
├── services/
│   ├── progress_service.dart  # Persistencia local con Hive
│   └── tts_service.dart       # Texto a voz (pronunciación)
├── widgets/
│   └── widgets.dart           # Botón de audio, títulos, chips
└── screens/
    ├── home_screen.dart       # Niveles + resumen de progreso
    ├── level_screen.dart      # Lista de lecciones del nivel
    ├── lesson_screen.dart     # Vocabulario, frases y gramática
    ├── exercise_screen.dart   # Los 5 tipos de ejercicio
    ├── result_screen.dart     # Puntaje, estrellas y XP ganado
    └── stats_screen.dart      # Estadísticas y reinicio de progreso
```

## Cómo agregar una lección nueva

1. Abre el archivo del nivel, por ejemplo `lib/data/nivel_1.dart`.
2. Añade un `Lesson(...)` a la lista `lessons` con `id` único (ej. `'n1l5'`).
3. Define `vocab`, `phrases`, `grammarTitle`, `grammarBody` y `exercises`.
4. Tipos de ejercicio disponibles: `ExerciseType.multipleChoice`,
   `fillBlank`, `matching`, `writing` y `listening`. Mira las lecciones
   existentes como plantilla: cada tipo necesita campos distintos
   (`options` + `correctIndex`, `acceptedAnswers`, `pairs`, `audioText`...).

No hay que tocar nada más: el progreso, el desbloqueo de niveles y las
estadísticas funcionan automáticamente con el nuevo contenido.

## Notas técnicas

- **Persistencia**: Hive guarda todo en el navegador (IndexedDB). Funciona
  sin conexión una vez cargada la app.
- **Audio**: `flutter_tts` usa la voz del sistema/navegador. Si no hay voz
  disponible, la app sigue funcionando sin audio.
- **Reglas de progreso**: un nivel se desbloquea al completar el 100% de las
  lecciones del nivel anterior. Completar una lección = terminar sus ejercicios
  (el puntaje solo afecta las estrellas y el XP: 10 XP por acierto + 20 extra
  por 100%).
