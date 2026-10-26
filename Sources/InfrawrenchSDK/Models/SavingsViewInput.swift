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

public struct SavingsViewInput: Codable, Hashable, Sendable {
    public var name: String
    public var description: String?
    public var status: SavingsFindingStatusFilter?
    public var filter: SavingsFindingFilter?
    public var sort: SavingsFindingSort?

    public init(
        name: String,
        description: String? = nil,
        status: SavingsFindingStatusFilter? = nil,
        filter: SavingsFindingFilter? = nil,
        sort: SavingsFindingSort? = nil
    ) {
        self.name = name
        self.description = description
        self.status = status
        self.filter = filter
        self.sort = sort
    }
}
