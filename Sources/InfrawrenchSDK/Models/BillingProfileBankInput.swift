/*
 * InfrawrenchSDK v1.84.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.84.0).
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
public struct BillingProfileBankInput: Codable, Hashable, Sendable {
    public var accountName: String?
    public var bankName: String?
    public var iban: String?
    public var bic: String?
    public var accountNumber: String?
    public var routingNumber: String?
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
