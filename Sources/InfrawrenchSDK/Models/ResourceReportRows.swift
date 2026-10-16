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

public struct ResourceReportRows: Codable, Hashable, Sendable {
    public struct Cost: Codable, Hashable, Sendable {
        public struct Window: Codable, Hashable, Sendable {
            public enum Window2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
                case range
                case mtd
                case previousMonth
                /// A value the API added after this SDK was generated. Kept
                /// rather than rejected, so a new server-side value cannot break
                /// decoding.
                case unrecognized(String)

                public init(rawValue: String) {
                    switch rawValue {
                    case "range": self = .range
                    case "mtd": self = .mtd
                    case "previous_month": self = .previousMonth
                    default: self = .unrecognized(rawValue)
                    }
                }

                public var rawValue: String {
                    switch self {
                    case .range: return "range"
                    case .mtd: return "mtd"
                    case .previousMonth: return "previous_month"
                    case .unrecognized(let value): return value
                    }
                }

                /// Every value the spec declares. `unrecognized` is deliberately absent.
                public static let allKnownCases: [Window2] = [
                    .range,
                    .mtd,
                    .previousMonth,
                ]

                public init(from decoder: any Decoder) throws {
                    self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
                }

                public func encode(to encoder: any Encoder) throws {
                    var container = encoder.singleValueContainer()
                    try container.encode(rawValue)
                }
            }

            public var window: Window2
            public var from: String
            public var to: String

            public init(
                window: Window2,
                from: String,
                to: String
            ) {
                self.window = window
                self.from = from
                self.to = to
            }
        }

        /// False without `costs:read` or a cost store: cost and virtual tag cells
        /// are empty.
        public var available: Bool
        public var reason: String?
        public var basis: CostBasis
        public var windows: [Window]

        public init(
            available: Bool,
            reason: String? = nil,
            basis: CostBasis,
            windows: [Window]
        ) {
            self.available = available
            self.reason = reason
            self.basis = basis
            self.windows = windows
        }
    }

    public var columns: [ResourceReportColumn]
    public var rows: [ResourceReportRow]
    /// Matching resources; a lower bound when `truncated`.
    public var total: Int
    public var offset: Int
    public var limit: Int
    /// A filter or the sort needed the in-memory scan and it stopped at 100,000
    /// resources.
    public var truncated: Bool
    public var sort: ResourceReportSort?
    /// Null when the report has no cost or virtual tag column.
    public var cost: Cost?

    public init(
        columns: [ResourceReportColumn],
        rows: [ResourceReportRow],
        total: Int,
        offset: Int,
        limit: Int,
        truncated: Bool,
        sort: ResourceReportSort? = nil,
        cost: Cost? = nil
    ) {
        self.columns = columns
        self.rows = rows
        self.total = total
        self.offset = offset
        self.limit = limit
        self.truncated = truncated
        self.sort = sort
        self.cost = cost
    }
}
