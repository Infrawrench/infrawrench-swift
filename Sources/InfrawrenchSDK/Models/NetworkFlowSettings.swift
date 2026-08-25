/*
 * InfrawrenchSDK v1.36.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.36.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct NetworkFlowSettings: Codable, Hashable, Sendable {
    public var enabled: Bool
    public var initialLookbackDays: Int

    public init(
        enabled: Bool,
        initialLookbackDays: Int
    ) {
        self.enabled = enabled
        self.initialLookbackDays = initialLookbackDays
    }
}
