/*
 * InfrawrenchSDK v1.76.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.76.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct FocusExportRequest: Codable, Hashable, Sendable {
    public enum Version: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case 14
        case 13
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "1.4": self = .14
            case "1.3": self = .13
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .14: return "1.4"
            case .13: return "1.3"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Version] = [
            .14,
            .13,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var from: String
    public var to: String
    public var filters: [CostFilter]?
    /// The same filter written as text, in the cost query language; an
    /// alternative to `filters`, compiled server-side into exactly that
    /// structure.
    ///
    /// Grammar: a conjunction of equality terms joined by `AND`. A term is
    /// `dimension = 'value'`, `dimension != 'value'`, `dimension IN ('a','b')` or
    /// `dimension NOT IN ('a','b')`; the tag dimension takes its key in brackets,
    /// `tag['owner'] = 'platform'`. Keywords are case-insensitive, strings may be
    /// single- or double-quoted, and a quote inside a value is escaped by
    /// doubling it (`'it''s'`) or with a backslash (`'it\'s'`).
    ///
    /// `OR` is deliberately not supported: the stored filter is a conjunction, so
    /// several values of one dimension go in an `IN` list and unrelated
    /// alternatives need separate queries. Anything the structured filter cannot
    /// express is a parse error rather than a second execution path.
    ///
    /// Sending both `query` and a non-empty `filters` is a 400, not a precedence
    /// rule. A parse failure is a 400 whose body carries `queryError` with the
    /// character `offset`, the `length` of the offending span, and the `expected`
    /// alternatives there.
    public var query: String?
    /// A saved cost filter (see /saved-cost-filters) applied by reference.
    /// Resolved server-side at query time and AND-composed with whichever of
    /// `filters`/`query` is present: unlike those two it is a composition, not an
    /// alternative. An id that does not resolve to a live filter is a 400; the
    /// query is never silently run unfiltered.
    public var savedFilterId: String?
    /// Restrict to these kinds of charge. Omitted is all of them, which is what
    /// makes an unfiltered total net rather than gross; credits, refunds and
    /// commitment discounts are included. Rows collected before charge types
    /// existed, and rows from providers that cannot distinguish them, are
    /// `usage`.
    public var chargeTypes: [CostChargeType]?
    /// The FOCUS version to write. Omitted means `1.3`.
    public var version: Version?

    public init(
        from: String,
        to: String,
        filters: [CostFilter]? = nil,
        query: String? = nil,
        savedFilterId: String? = nil,
        chargeTypes: [CostChargeType]? = nil,
        version: Version? = nil
    ) {
        self.from = from
        self.to = to
        self.filters = filters
        self.query = query
        self.savedFilterId = savedFilterId
        self.chargeTypes = chargeTypes
        self.version = version
    }
}
