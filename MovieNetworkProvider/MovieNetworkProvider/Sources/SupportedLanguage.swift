import Foundation

public enum SupportedLanguage {
    case english
    case polish
    case spanish
    case italian


    public var code: String {
        switch self {
        case .english:
            "en-US"
        case .polish:
            "pl-PL"
        case .spanish:
            "es-ES"
        case .italian:
            "it-IT"
        }
    }

}
