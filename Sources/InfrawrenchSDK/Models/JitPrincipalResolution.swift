/*
 * InfrawrenchSDK v1.77.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.77.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct JitPrincipalResolution: Codable, Hashable, Sendable {
    public var principal: JitPrincipalOption?
    public var canPick: Bool
    public var labels: JitProviderLabels

    public init(
        principal: JitPrincipalOption? = nil,
        canPick: Bool,
        labels: JitProviderLabels
    ) {
        self.principal = principal
        self.canPick = canPick
        self.labels = labels
    }
}
