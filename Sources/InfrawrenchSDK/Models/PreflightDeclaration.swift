/*
 * InfrawrenchSDK v1.38.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.38.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Declared when the plugin supports credential preflight (per-capability
/// permission checks). `null` for plugins without it.
///
/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct PreflightDeclaration: Codable, Hashable, Sendable {
    public struct TemplateFormat: Codable, Hashable, Sendable {
        public enum Language: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case json
            case yaml
            case text
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "json": self = .json
                case "yaml": self = .yaml
                case "text": self = .text
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .json: return "json"
                case .yaml: return "yaml"
                case .text: return "text"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Language] = [
                .json,
                .yaml,
                .text,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var label: String
        public var language: Language

        public init(
            label: String,
            language: Language
        ) {
            self.label = label
            self.language = language
        }
    }

    public var capabilities: [PreflightCapability]
    public var templateFormat: TemplateFormat?

    public init(
        capabilities: [PreflightCapability],
        templateFormat: TemplateFormat? = nil
    ) {
        self.capabilities = capabilities
        self.templateFormat = templateFormat
    }
}
