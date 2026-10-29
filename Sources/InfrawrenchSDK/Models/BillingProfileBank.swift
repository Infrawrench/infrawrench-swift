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

/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct BillingProfileBank: Codable, Hashable, Sendable {
    public var accountName: String?
    public var bankName: String?
    /// Checked against its mod-97 digits and stored grouped in fours. Masked to
    /// its last four characters in audit entries.
    public var iban: String?
    /// SWIFT / BIC.
    public var bic: String?
    /// For banking systems without IBANs. Masked in audit entries.
    public var accountNumber: String?
    /// Sort code, ABA routing number, BSB.
    public var routingNumber: String?
    /// Free-text remittance instructions, printed under the bank details.
    public var instructions: String?

    public init(
        accountName: String? = nil,
        bankName: String? = nil,
        iban: String? = nil,
        bic: String? = nil,
        accountNumber: String? = nil,
        routingNumber: String? = nil,
        instructions: String? = nil
    ) {
        self.accountName = accountName
        self.bankName = bankName
        self.iban = iban
        self.bic = bic
        self.accountNumber = accountNumber
        self.routingNumber = routingNumber
        self.instructions = instructions
    }
}
