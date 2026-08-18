/*
 * InfrawrenchSDK v1.29.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// A customer a managed service provider bills. A cost centre or cloud account
/// belongs to at most one managed account — billing the same money to two
/// customers is refused at write time with a 409 naming the other customer.
public struct ManagedAccount: Codable, Hashable, Sendable {
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

    public var id: String
    public var name: String
    public var contactName: String?
    public var contactEmail: String?
    public var billingAddress: String?
    public var billingCurrency: String
    public var costBasis: CostBasis2
    public var applyBillingRules: Bool
    public var notes: String?
    public var costCentreIds: [String]
    public var accountIds: [String]
    public var invoiceCount: Int
    public var createdByUserId: String?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        name: String,
        contactName: String? = nil,
        contactEmail: String? = nil,
        billingAddress: String? = nil,
        billingCurrency: String,
        costBasis: CostBasis2,
        applyBillingRules: Bool,
        notes: String? = nil,
        costCentreIds: [String],
        accountIds: [String],
        invoiceCount: Int,
        createdByUserId: String? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
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
        self.invoiceCount = invoiceCount
        self.createdByUserId = createdByUserId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
