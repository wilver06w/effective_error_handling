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
