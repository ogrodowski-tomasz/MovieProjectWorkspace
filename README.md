# MovieProjectWorkspace


MovieWorkspace to główny workspace projektu, który zawiera:

- Kod źródłowy frameworka `MovieNetworkProvider`.
- DemoApp – aplikację demo służącą do testowania i weryfikowania działania frameworka w środowisku iOS.

## Struktura

- `MovieNetworkProvider/` – katalog z kodem źródłowym frameworka.
- `MovieDemoApp/` – projekt aplikacji demonstracyjnej wykorzystującej framework.
- `MovieWorkspace.xcworkspace` – główny workspace, zawiera oba powyższe projekty.

## Jak korzystać

1. Otwórz workspace w Xcode:
2. Buduj i uruchamiaj `MovieDemoApp` aby przetestować framework.
3. Kod źródłowy frameworka może być używany do developmentu oraz do budowy xcframework w Fastlane.
