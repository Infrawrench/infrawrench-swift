/*
 * InfrawrenchSDK v1.73.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.73.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// An expression rule that could not price some lines (division by zero, a
/// non-finite result). Those lines kept their previous cost rather than becoming
/// zero.
public struct PricingExpressionFailure: Codable, Hashable, Sendable {
    public var ruleId: String
    public var name: String
    public var lines: Int
    public var message: String

    public init(
        ruleId: String,
        name: String,
        lines: Int,
        message: String
    ) {
        self.ruleId = ruleId
        self.name = name
        self.lines = lines
        self.message = message
    }
}
