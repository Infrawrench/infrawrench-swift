/*
 * InfrawrenchSDK v1.18.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.18.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CredentialFormat: Codable, Hashable, Sendable {
    public enum MediaType: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case json
        case text
        case ini
        case binaryBase64
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "json": self = .json
            case "text": self = .text
            case "ini": self = .ini
            case "binary-base64": self = .binaryBase64
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .json: return "json"
            case .text: return "text"
            case .ini: return "ini"
            case .binaryBase64: return "binary-base64"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [MediaType] = [
            .json,
            .text,
            .ini,
            .binaryBase64,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// Passed back as `formatId` on export.
    public var id: String
    public var label: String
    public var description: String?
    /// How the credential body should be presented. `binary-base64` means
    /// `content` is base64.
    public var mediaType: MediaType
    /// Suggested filename; `{resource}` is replaced with the resource's external
    /// id.
    public var filenameTemplate: String?

    public init(
        id: String,
        label: String,
        description: String? = nil,
        mediaType: MediaType,
        filenameTemplate: String? = nil
    ) {
        self.id = id
        self.label = label
        self.description = description
        self.mediaType = mediaType
        self.filenameTemplate = filenameTemplate
    }
}
