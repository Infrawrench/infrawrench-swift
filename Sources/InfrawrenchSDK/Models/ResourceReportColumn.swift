/*
 * InfrawrenchSDK v1.82.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.82.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ResourceReportColumn: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case core
        case field
        case tag
        case vtag
        case cost
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "core": self = .core
            case "field": self = .field
            case "tag": self = .tag
            case "vtag": self = .vtag
            case "cost": self = .cost
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .core: return "core"
            case .field: return "field"
            case .tag: return "tag"
            case .vtag: return "vtag"
            case .cost: return "cost"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .core,
            .field,
            .tag,
            .vtag,
            .cost,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// `<kind>:<key>`.
    /// `core:name|type|provider|account|region|status|created|external_id`;
    /// `field:<key>` a key of the resource's synced fields (offered by `GET
    /// /resource-reports/options`); `tag:<key>` a provider tag; `vtag:<key>` a
    /// virtual tag, read from the resource's own cost rows over `costRange` (the
    /// value holding the most spend); `cost:range|mtd|previous_month` spend
    /// joined by provider resource id.
    public var id: String
    public var kind: Kind
    public var key: String
    /// English label, as the CSV header prints it.
    public var label: String

    public init(
        id: String,
        kind: Kind,
        key: String,
        label: String
    ) {
        self.id = id
        self.kind = kind
        self.key = key
        self.label = label
    }
}
