/*
 * InfrawrenchSDK v1.14.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.14.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ManagedAccountInput: Codable, Hashable, Sendable {
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

    public var name: String
    public var contactName: String?
    public var contactEmail: String?
    public var billingAddress: String?
    /// ISO 4217 code the customer is invoiced in. Spend collected in another
    /// currency is converted through the organisation's own stated exchange
    /// rates, and the rate used is frozen onto every invoice — so restating a
    /// rate later cannot restate history.
    public var billingCurrency: String
    /// Defaults to `amortized`. Charging a customer the whole cash value of a
    /// three-year commitment in the month it was signed is not a bill anyone can
    /// budget against.
    public var costBasis: CostBasis2?
    /// Defaults to true. False is a pass-through contract: the customer is billed
    /// exactly what the providers charged, with no markup, discount or fixed fee
    /// applied.
    public var applyBillingRules: Bool?
    public var notes: String?
    /// Cost centres whose spend belongs to this customer. **Subtrees are
    /// included** — naming a parent bills every descendant, and naming both a
    /// parent and its child bills the child once, not twice.
    ///
    /// This is deliberately a list of existing cost centres rather than a rule of
    /// its own. Which spend lands in which centre is already decided by the
    /// organisation's allocation rules, and a second vocabulary over the same
    /// data would eventually disagree with the first — at which point an invoice
    /// would stop matching the showback report the customer was shown.
    public var costCentreIds: [String]?
    /// Cloud accounts whose spend belongs to this customer. Evaluated **after**
    /// every allocation rule, so an account in scope claims only the spend no
    /// cost centre already claimed. Every cost row therefore resolves exactly
    /// once: nothing is billed twice and nothing goes missing.
    public var accountIds: [String]?

    public init(
        name: String,
        contactName: String? = nil,
        contactEmail: String? = nil,
        billingAddress: String? = nil,
        billingCurrency: String,
        costBasis: CostBasis2? = nil,
        applyBillingRules: Bool? = nil,
        notes: String? = nil,
        costCentreIds: [String]? = nil,
        accountIds: [String]? = nil
    ) {
        self.name = name
        self.contactName = contactName
        self.contactEmail = contactEmail
        self.billingAddress = billingAddress
        self.billingCurrency = billingCurrency
        self.costBasis = costBasis
        self.applyBillingRules = applyBillingRules
        self.notes = notes
        self.costCentreIds = costCentreIds
        self.accountIds = accountIds
    }
}
