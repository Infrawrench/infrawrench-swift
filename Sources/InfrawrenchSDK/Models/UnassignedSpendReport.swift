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

/// Spend in the period no customer is billed for. Resolved exactly the way an
/// invoice resolves it: allocation rules claim spend for cost centres first, and
/// each account claims only what no rule did. A cost centre is assigned when it
/// or any ancestor is on a customer. Raw spend on the amortized basis, before
/// billing rules.
public struct UnassignedSpendReport: Codable, Hashable, Sendable {
    public struct Row: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case costCentre
            case account
            case unallocated
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "cost_centre": self = .costCentre
                case "account": self = .account
                case "unallocated": self = .unallocated
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .costCentre: return "cost_centre"
                case .account: return "account"
                case .unallocated: return "unallocated"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .costCentre,
                .account,
                .unallocated,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        /// `unallocated` is spend that resolved to no cost centre and no
        /// connected account (a disconnected account, an uploaded source); it
        /// cannot be assigned.
        public var kind: Kind
        public var id: String?
        /// Cost centres carry their full path.
        public var name: String
        public var pluginId: String?
        /// Currency code → amount in the currency's major unit.
        public var amounts: [String: Double]

        public init(
            kind: Kind,
            id: String? = nil,
            name: String,
            pluginId: String? = nil,
            amounts: [String: Double]
        ) {
            self.kind = kind
            self.id = id
            self.name = name
            self.pluginId = pluginId
            self.amounts = amounts
        }
    }

    public struct Totals: Codable, Hashable, Sendable {
        /// Currency code → amount in the currency's major unit.
        public var unassigned: [String: Double]
        /// Currency code → amount in the currency's major unit.
        public var assigned: [String: Double]
        /// Currency code → amount in the currency's major unit.
        public var all: [String: Double]

        public init(
            unassigned: [String: Double],
            assigned: [String: Double],
            all: [String: Double]
        ) {
            self.unassigned = unassigned
            self.assigned = assigned
            self.all = all
        }
    }

    public var periodFrom: String
    public var periodTo: String
    public var rows: [Row]
    public var totals: Totals
    public var assignable: Int

    public init(
        periodFrom: String,
        periodTo: String,
        rows: [Row],
        totals: Totals,
        assignable: Int
    ) {
        self.periodFrom = periodFrom
        self.periodTo = periodTo
        self.rows = rows
        self.totals = totals
        self.assignable = assignable
    }
}
