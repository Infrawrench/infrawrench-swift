/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Null sorts by name, ascending.
///
/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct ResourceReportSort: Codable, Hashable, Sendable {
    public enum Direction: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case asc
        case desc
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "asc": self = .asc
            case "desc": self = .desc
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .asc: return "asc"
            case .desc: return "desc"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Direction] = [
            .asc,
            .desc,
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
    public var column: String
    public var direction: Direction

    public init(
        column: String,
        direction: Direction
    ) {
        self.column = column
        self.direction = direction
    }
}
