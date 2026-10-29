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

public struct ManagedAccountAssignmentPreview: Codable, Hashable, Sendable {
    public struct Target: Codable, Hashable, Sendable {
        public var id: String
        public var name: String

        public init(
            id: String,
            name: String
        ) {
            self.id = id
            self.name = name
        }
    }

    public struct Item: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case costCentre
            case account
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "cost_centre": self = .costCentre
                case "account": self = .account
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .costCentre: return "cost_centre"
                case .account: return "account"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .costCentre,
                .account,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var kind: Kind
        public var id: String
        public var name: String
        public var fromManagedAccountId: String?
        public var fromManagedAccountName: String?
        /// Spend that moves with the item: a cost centre's whole subtree, an
        /// account's spend no cost centre claimed.
        public var amounts: [String: Double]
        public var unchanged: Bool

        public init(
            kind: Kind,
            id: String,
            name: String,
            fromManagedAccountId: String? = nil,
            fromManagedAccountName: String? = nil,
            amounts: [String: Double],
            unchanged: Bool
        ) {
            self.kind = kind
            self.id = id
            self.name = name
            self.fromManagedAccountId = fromManagedAccountId
            self.fromManagedAccountName = fromManagedAccountName
            self.amounts = amounts
            self.unchanged = unchanged
        }
    }

    public struct Move: Codable, Hashable, Sendable {
        public var fromManagedAccountId: String?
        public var fromManagedAccountName: String?
        /// Currency code → amount in the currency's major unit.
        public var amounts: [String: Double]

        public init(
            fromManagedAccountId: String? = nil,
            fromManagedAccountName: String? = nil,
            amounts: [String: Double]
        ) {
            self.fromManagedAccountId = fromManagedAccountId
            self.fromManagedAccountName = fromManagedAccountName
            self.amounts = amounts
        }
    }

    public var periodFrom: String
    public var periodTo: String
    public var target: Target?
    public var items: [Item]
    public var moves: [Move]
    /// Currency code → amount in the currency's major unit.
    public var total: [String: Double]
    public var affectedDrafts: Int
    public var warnings: [String]

    public init(
        periodFrom: String,
        periodTo: String,
        target: Target? = nil,
        items: [Item],
        moves: [Move],
        total: [String: Double],
        affectedDrafts: Int,
        warnings: [String]
    ) {
        self.periodFrom = periodFrom
        self.periodTo = periodTo
        self.target = target
        self.items = items
        self.moves = moves
        self.total = total
        self.affectedDrafts = affectedDrafts
        self.warnings = warnings
    }
}
