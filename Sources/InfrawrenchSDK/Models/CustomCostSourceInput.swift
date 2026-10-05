/*
 * InfrawrenchSDK v1.67.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.67.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CustomCostSourceInput: Codable, Hashable, Sendable {
    /// Unique within the organization (case-insensitively). Shown as the provider
    /// name in every cost report; renaming relabels the source's whole history.
    public var name: String
    public var description: String?
    /// ISO 4217 code applied to rows whose file has no currency column. Null
    /// means every file must carry one.
    public var defaultCurrency: String?

    public init(
        name: String,
        description: String? = nil,
        defaultCurrency: String? = nil
    ) {
        self.name = name
        self.description = description
        self.defaultCurrency = defaultCurrency
    }
}
