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

public struct ExchangeRateImportResult: Codable, Hashable, Sendable {
    public struct Row: Codable, Hashable, Sendable {
        public enum Action: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case create
            case update
            case unchanged
            case error
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "create": self = .create
                case "update": self = .update
                case "unchanged": self = .unchanged
                case "error": self = .error
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .create: return "create"
                case .update: return "update"
                case .unchanged: return "unchanged"
                case .error: return "error"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Action] = [
                .create,
                .update,
                .unchanged,
                .error,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        /// Line in the file; the header is line 1.
        public var line: Int
        /// `create`: no stated rate for this pair and effective date yet.
        /// `update`: one exists with a different rate or end date, and is
        /// replaced. `unchanged`: identical to what is stored. `error`: invalid,
        /// with `error` saying why.
        public var action: Action
        public var rate: ExchangeRateInput?
        /// The stored rate an `update` replaces.
        public var previousRate: String?
        public var previousEffectiveTo: String?
        public var error: String?

        public init(
            line: Int,
            action: Action,
            rate: ExchangeRateInput? = nil,
            previousRate: String? = nil,
            previousEffectiveTo: String? = nil,
            error: String? = nil
        ) {
            self.line = line
            self.action = action
            self.rate = rate
            self.previousRate = previousRate
            self.previousEffectiveTo = previousEffectiveTo
            self.error = error
        }
    }

    public struct Counts: Codable, Hashable, Sendable {
        public var create: Int
        public var update: Int
        public var unchanged: Int
        public var error: Int

        public init(
            create: Int,
            update: Int,
            unchanged: Int,
            error: Int
        ) {
            self.create = create
            self.update = update
            self.unchanged = unchanged
            self.error = error
        }
    }

    /// True when nothing was written.
    public var dryRun: Bool
    /// True when the rows were written.
    public var applied: Bool
    public var rows: [Row]
    public var counts: Counts
    /// A problem with the file as a whole (a missing column, too many rows, the
    /// org's rate cap); `rows` is then empty or unapplied.
    public var fileError: String?

    public init(
        dryRun: Bool,
        applied: Bool,
        rows: [Row],
        counts: Counts,
        fileError: String? = nil
    ) {
        self.dryRun = dryRun
        self.applied = applied
        self.rows = rows
        self.counts = counts
        self.fileError = fileError
    }
}
