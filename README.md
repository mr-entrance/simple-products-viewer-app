# simple_product_viewer_app

## Assumptions and Design Decisions

- This app was developed as a proof of concept, so the structure is intentionally kept simple.
- The UI interacts with Cubit for state management, and Cubit communicates with services to fetch data.
- Libraries such as cubit and go_router are included from the beginning to ensure a smooth transition to a production-ready application.
- State management is handled by cubit, with future scalability to bloc in mind.
- Navigation is managed by go_router. Although not strictly necessary for a PoC, it was included early to prepare for future production use (go_router_builder will also be considered).
- Product data is fetched from an API, while recently viewed products and cart items are stored in memory. For a PoC or demo, in-memory storage is sufficient, though server or cache storage would be preferable in production.
- Error handling is implemented at a minimal level, focusing on essential cases to keep the codebase simple for this proof of concept.

## Setup Instructions

### 1. Install FVM & Flutter

Refer to the [FVM installation guide](https://fvm.app/documentation/getting-started/installation).

### 2. Install dependencies


```bash
fvm flutter pub get
```

### 3. Run the app

```bash
fvm flutter run
```

## Files pasted from other sources

I added comment out something like `//TODO copied from` OR `#TODO copied from`

## Used plugins and their documentations

### Bloc

https://bloclibrary.dev/flutter-bloc-concepts/#multiblocprovider

### get_it
https://flutter-it.dev/documentation/get_it/object_registration

### go_router
https://pub.dev/documentation/go_router/latest/topics/Get%20started-topic.html

### freezed
https://pub.dev/packages/freezed#deserializing-generic-classes

