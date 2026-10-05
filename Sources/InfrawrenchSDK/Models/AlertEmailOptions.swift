/*
 * InfrawrenchSDK v1.74.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.74.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AlertEmailOptions: Codable, Hashable, Sendable {
    /// Whether this deployment has a mail provider configured. False means alert
    /// email is never sent.
    public var emailAvailable: Bool
    public var members: [AlertEmailMember]
    public var settings: AlertEmailSettings
    /// Domains the organization's members sign in with: the implicit allowlist.
    public var memberDomains: [String]

    public init(
        emailAvailable: Bool,
        members: [AlertEmailMember],
        settings: AlertEmailSettings,
        memberDomains: [String]
    ) {
        self.emailAvailable = emailAvailable
        self.members = members
        self.settings = settings
        self.memberDomains = memberDomains
    }
}
