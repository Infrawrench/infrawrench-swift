/*
 * InfrawrenchSDK v1.39.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.39.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct OrgConfigRequest: Codable, Hashable, Sendable {
    public enum Mode: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case merge
        case replace
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "merge": self = .merge
            case "replace": self = .replace
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .merge: return "merge"
            case .replace: return "replace"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Mode] = [
            .merge,
            .replace,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var document: OrgConfigDocument
    /// `merge` creates and updates what the document names and leaves everything
    /// else alone. `replace` additionally deletes entities the document does not
    /// name, within the sections it carries.
    public var mode: Mode?

    public init(
        document: OrgConfigDocument,
        mode: Mode? = nil
    ) {
        self.document = document
        self.mode = mode
    }
}
