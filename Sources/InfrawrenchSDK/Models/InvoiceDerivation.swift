/*
 * InfrawrenchSDK v1.16.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.16.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Everything needed to re-derive the invoice by hand. Not decoration: an invoice
/// a customer cannot reconcile is an invoice a customer does not pay.
public struct InvoiceDerivation: Codable, Hashable, Sendable {
    public enum CostBasis2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case cash
        case amortized
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "cash": self = .cash
            case "amortized": self = .amortized
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .cash: return "cash"
            case .amortized: return "amortized"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [CostBasis2] = [
            .cash,
            .amortized,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public struct Rate: Codable, Hashable, Sendable {
        public var currency: String
        public var rate: Double
        public var effectiveFrom: String

        public init(
            currency: String,
            rate: Double,
            effectiveFrom: String
        ) {
            self.currency = currency
            self.rate = rate
            self.effectiveFrom = effectiveFrom
        }
    }

    public struct Rule: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case percentage
            case fixed
            case reallocation
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "percentage": self = .percentage
                case "fixed": self = .fixed
                case "reallocation": self = .reallocation
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .percentage: return "percentage"
                case .fixed: return "fixed"
                case .reallocation: return "reallocation"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .percentage,
                .fixed,
                .reallocation,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var id: String
        public var name: String
        public var kind: Kind
        public var summary: String

        public init(
            id: String,
            name: String,
            kind: Kind,
            summary: String
        ) {
            self.id = id
            self.name = name
            self.kind = kind
            self.summary = summary
        }
    }

    public struct Scope: Codable, Hashable, Sendable {
        public struct CostCentre2: Codable, Hashable, Sendable {
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

        public struct Account2: Codable, Hashable, Sendable {
            public var id: String
            public var label: String

            public init(
                id: String,
                label: String
            ) {
                self.id = id
                self.label = label
            }
        }

        public var costCentres: [CostCentre2]
        public var accounts: [Account2]

        public init(
            costCentres: [CostCentre2],
            accounts: [Account2]
        ) {
            self.costCentres = costCentres
            self.accounts = accounts
        }
    }

    public var costBasis: CostBasis2
    public var applyBillingRules: Bool
    /// The day the exchange rates were read — always the period's last day. One
    /// rate for the period rather than a per-day blend: “January, at the 31
    /// January rate” is a sentence a finance team can reproduce.
    public var rateDate: String
    public var rates: [Rate]
    /// Currencies the organisation had stated no usable rate for. A non-empty
    /// list blocks approval: an invoice that cannot be expressed as one number in
    /// the customer's currency must not be frozen.
    public var unconverted: [String]
    public var rules: [Rule]
    public var scope: Scope
    /// Scope entries that no longer exist. Recorded rather than silently skipped
    /// — an invoice that is quietly short is worse than one that says why.
    public var missingScope: [String]

    public init(
        costBasis: CostBasis2,
        applyBillingRules: Bool,
        rateDate: String,
        rates: [Rate],
        unconverted: [String],
        rules: [Rule],
        scope: Scope,
        missingScope: [String]
    ) {
        self.costBasis = costBasis
        self.applyBillingRules = applyBillingRules
        self.rateDate = rateDate
        self.rates = rates
        self.unconverted = unconverted
        self.rules = rules
        self.scope = scope
        self.missingScope = missingScope
    }
}
