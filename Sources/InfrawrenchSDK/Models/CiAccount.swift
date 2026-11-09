/*
 * InfrawrenchSDK v1.100.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.100.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CiAccount: Codable, Hashable, Sendable {
    public var installationId: Int
    public var accountLogin: String
    public var accountType: String?
    public var ciEnabled: Bool

    public init(
        installationId: Int,
        accountLogin: String,
        accountType: String? = nil,
        ciEnabled: Bool
    ) {
        self.installationId = installationId
        self.accountLogin = accountLogin
        self.accountType = accountType
        self.ciEnabled = ciEnabled
    }
}
