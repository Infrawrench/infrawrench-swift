/*
 * InfrawrenchSDK v1.104.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.104.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BillingProfileInput: Codable, Hashable, Sendable {
    /// What the profile is called in pickers. Not printed on the invoice.
    public var name: String
    public var legalName: String?
    public var address: String?
    public var taxId: String?
    public var poNumber: String?
    /// Addresses invoices are emailed to, **in addition to** each customer's own
    /// contact email.
    public var toEmails: [String]?
    /// Addresses that receive a copy. Each address gets its own message.
    public var ccEmails: [String]?
    public var currency: String?
    public var paymentTermsDays: Int?
    /// Starts with a letter; letters, digits and hyphens. Defaults to `INV`.
    /// Profiles sharing a prefix share a sequence.
    public var numberPrefix: String?
    /// Defaults to true: `INV-2026-0001`, with the sequence restarting each year
    /// of the period end. False gives `INV-0001` and one sequence for ever.
    public var numberIncludesYear: Bool?
    /// The lowest sequence number issued, for continuing a sequence from another
    /// system.
    public var numberStart: Int?
    public var taxRates: [BillingProfileTaxRate]?
    public var bank: BillingProfileBankInput?
    public var footer: String?
    public var logo: String?

    public init(
        name: String,
        legalName: String? = nil,
        address: String? = nil,
        taxId: String? = nil,
        poNumber: String? = nil,
        toEmails: [String]? = nil,
        ccEmails: [String]? = nil,
        currency: String? = nil,
        paymentTermsDays: Int? = nil,
        numberPrefix: String? = nil,
        numberIncludesYear: Bool? = nil,
        numberStart: Int? = nil,
        taxRates: [BillingProfileTaxRate]? = nil,
        bank: BillingProfileBankInput? = nil,
        footer: String? = nil,
        logo: String? = nil
    ) {
        self.name = name
        self.legalName = legalName
        self.address = address
        self.taxId = taxId
        self.poNumber = poNumber
        self.toEmails = toEmails
        self.ccEmails = ccEmails
        self.currency = currency
        self.paymentTermsDays = paymentTermsDays
        self.numberPrefix = numberPrefix
        self.numberIncludesYear = numberIncludesYear
        self.numberStart = numberStart
        self.taxRates = taxRates
        self.bank = bank
        self.footer = footer
        self.logo = logo
    }
}
