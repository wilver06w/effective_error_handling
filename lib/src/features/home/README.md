# 🏠 Feature Home

Este módulo implementa la funcionalidad principal de la aplicación, siguiendo los principios de Clean Architecture.

## 📁 Estructura

```
home/
├── data/                  # Capa de datos
│   ├── data_sources/     # Fuentes de datos (API)
│   ├── models/           # Modelos de datos
│   └── repositories/     # Implementaciones de repositorios
├── domain/               # Capa de dominio
│   ├── entities/         # Entidades de negocio
│   ├── repositories/     # Interfaces de repositorios
│   └── usecases/        # Casos de uso
└── presentation/         # Capa de presentación
    ├── pages/           # Páginas/Pantallas
    ├── widgets/         # Widgets reutilizables
    └── bloc/            # Lógica de estado (BLoC)
```

## 🎯 Responsabilidades

- **Data Layer**: Maneja la obtención y persistencia de datos
  - Implementa la comunicación con APIs remotas
  - Define modelos de datos
  - Implementa repositorios concretos

- **Domain Layer**: Contiene la lógica de negocio
  - Define entidades del dominio
  - Establece contratos de repositorios
  - Implementa casos de uso

- **Presentation Layer**: Maneja la UI y el estado
  - Implementa la interfaz de usuario
  - Gestiona el estado de la aplicación
  - Maneja la navegación

## 🔄 Flujo de Datos

1. La UI solicita datos a través de un caso de uso
2. El caso de uso utiliza un repositorio
3. El repositorio obtiene datos de las fuentes de datos
4. Los datos se transforman y se presentan en la UI

## 🛠️ Dependencias

Este módulo utiliza:
- `flutter_modular` para inyección de dependencias
- `dartz` para manejo funcional de errores
- `dio` para comunicación HTTP
- `bloc` para manejo de estado

# 🧠 Revisión Técnica – Manejo de Errores y Estructura del Proyecto

_Revisa @albertjjimenezp – Embajador técnico Flutter en Pragma_

Este documento recoge observaciones realizadas con fines de revisión para la charla técnica sobre **manejo de errores** en Flutter. Su objetivo es facilitar una conversación constructiva en torno a mejoras posibles y alinear la implementación con buenas prácticas de arquitectura limpia.

---

## 🔎 Observaciones Identificadas

### 1. 🔧 Análisis estático de código (Dart Analysis)
- **Errores**: 3
- **Warnings**: 2
- **Hints**: 143
  📝 Recomendación: Ejecutar `dart fix --dry-run` para identificar oportunidades de corrección automática. Alinear el proyecto con las reglas de `pedantic` o `very_good_analysis` podría mejorar la calidad del código.

---

### 2. 🧼 Uso de paquetes obsoletos

- `package_api_docs` y `unsafe_html` fueron **removidos en Dart 3.7.0**.
  ❗ Sugerencia: Revisar la versión del SDK en `pubspec.yaml` y eliminar dependencias incompatibles.

---

### 3. 🏗️ Estructura de carpetas y Clean Architecture

Aunque el proyecto intenta seguir una estructura modularizada, hay oportunidades de mejora para reflejar de forma más clara los principios de Clean Architecture:

#### 🔹 Problemas observados:
- Mezcla de responsabilidades en `lib/src/app/features/home`, donde `inject.dart` convive con presentación y lógica.
- La carpeta `presentation/_sections` puede confundir a la audiencia al no diferenciar entre widgets UI y controladores (Bloc, Presenter...).
- Faltan distinciones claras entre `Gateways`, `Repositories`, y `UseCases`.

#### ✅ Sugerencia de estructura:

```bash
lib/
└── src/
    └── features/
        └── home/
            ├── data/
            │   ├── datasources/
            │   ├── models/
            │   └── repositories/
            ├── domain/
            │   ├── entities/
            │   ├── repositories/
            │   └── usecases/
            └── presentation/
                ├── pages/
                ├── widgets/
                └── bloc/
```

Esto permite que la audiencia identifique claramente el flujo de datos y responsabilidades según los niveles de abstracción.

---

### 4. 📦 Revisión de `inject.dart` con `flutter_modular`

Se está usando `flutter_modular` como contenedor de inyección, lo cual es válido y moderno. Sin embargo, se proponen mejoras para mayor claridad y escalabilidad:

#### ✅ Positivos:
- Buen uso de `addLazySingleton`.
- Registro de dependencias por interfaz, respetando inversión de dependencias.

#### 🛠️ Recomendaciones:

1. **Modularizar los bindings**: Separar los módulos por capa o funcionalidad mejora la escalabilidad.

```dart
class DataModule {
  static void binds(Injector i) {
    i.addLazySingleton<OrdersImplApiRemote>(OrdersImplApiRemote.new);
  }
}

class DomainModule {
  static void binds(Injector i) {
    i
      ..addLazySingleton<AbstractOrdersRepository>(OrdersRepositoryImpl.new)
      ..addLazySingleton<GetOrdersUseCase>(GetOrdersUseCase.new);
  }
}

class InjectHome {
  static void binds(Injector i) {
    DataModule.binds(i);
    DomainModule.binds(i);
  }
}
```

2. **Agregar documentación** sobre las dependencias inyectadas.

```dart
/// Inyecta las dependencias del feature `home`:
/// - `OrdersImplApiRemote`: cliente remoto para obtener órdenes.
/// - `OrdersRepositoryImpl`: implementación del repositorio de órdenes.
/// - `GetOrdersUseCase`: caso de uso para obtener órdenes.
```

3. **Asegurar testabilidad**: Verificar que las clases inyectadas tengan constructores compatibles o dependencias también registradas.

---

### 5. 📦 Paquetes involucrados

El proyecto incluye una amplia cantidad de paquetes, lo cual puede resultar abrumador en una demo sencilla. Sin embargo, es comprensible si la intención es **mostrar múltiples escenarios pedagógicos** de manejo de errores.

#### 🧩 Paquetes clave:
- `dartz`: manejo funcional con `Either<L, R>` para errores.
- `dio`, `dio_cache_interceptor`, `dio_smart_retry`: para demostrar estrategias avanzadas de networking y resiliencia.
- `freezed`, `freezed_annotation`, `equatable`: para modelado inmutable y comparación segura.
- `flutter_modular`, `bloc`, `flutter_bloc`: integración de dependencias y control de estado de forma estructurada.

📝 Recomendación: aclarar en la documentación o durante la charla que el uso de estos paquetes es **intencionalmente didáctico** para explorar diferentes abordajes al manejo de errores.

---

## 📘 Recomendaciones adicionales

- Añadir archivos `README.md` a nivel de cada feature (`home`, `orders`, etc.) explicando brevemente la responsabilidad del módulo.
- Documentar en `inject.dart` los bindings de dependencias, idealmente usando `get_it` o `riverpod` según convención.
- Establecer convenciones para nombres de carpetas (por ejemplo, usar `widgets/` en lugar de `_sections/`).

