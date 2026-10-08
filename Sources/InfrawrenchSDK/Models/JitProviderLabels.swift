/*
 * InfrawrenchSDK v1.79.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.79.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct JitProviderLabels: Codable, Hashable, Sendable {
    public var scopeLabel: String
    public var roleLabel: String
    public var principalLabel: String
    public var description: String?
    /// True when the provider itself ends the access on time (a time-bound IAM
    /// Condition).
    public var providerEnforcedExpiry: Bool
    public var principalPicker: Bool

    public init(
        scopeLabel: String,
        roleLabel: String,
        principalLabel: String,
        description: String? = nil,
        providerEnforcedExpiry: Bool,
        principalPicker: Bool
    ) {
        self.scopeLabel = scopeLabel
        self.roleLabel = roleLabel
        self.principalLabel = principalLabel
        self.description = description
        self.providerEnforcedExpiry = providerEnforcedExpiry
        self.principalPicker = principalPicker
    }
}
