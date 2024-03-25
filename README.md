## Getting Started 🚀

_1. Supports iOS and Android_

_2. Starter project with GetX architecture_

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

---

## Define flavor specific variables 🍭

```dart
String baseUrl get {
    switch(appFlavor) {
        case Flavor.development:
            return "api.dev"
        case Flavor.staging:
            return "api.staging"
        case Flavor.production:
            return "api.production"
    }
}
```
When cloning and running this project, ensure that you start your own instance of JSON Server on a unique port to avoid conflicts. Use the following command to start JSON Server on your preferred port:
Clean Architecture
This project follows the principles of Clean Architecture, a software design philosophy that emphasizes separation of concerns and maintainability. The architecture is structured into distinct layers, each with its own responsibilities and dependencies, allowing for easier testing, scalability, and flexibility.

Layers
Presentation Layer: Contains the user interface components, such as screens, widgets, and controllers. This layer is responsible for interacting with the user and presenting data.

Domain Layer: Contains the business logic and entities of the application. This layer defines the core functionality of the application, independent of any external factors.

Data Layer: Contains the implementation of data access and storage. This layer interacts with external services, such as APIs or databases, to retrieve and store data.

Benefits
Maintainability: Clean Architecture promotes code that is easier to understand and maintain, as each layer has well-defined responsibilities.
Testability: The architecture makes it easier to write unit tests for each layer independently, leading to more reliable and robust code.
Flexibility: Clean Architecture allows for easier modification and extension of the application, as changes in one layer do not affect the others.
