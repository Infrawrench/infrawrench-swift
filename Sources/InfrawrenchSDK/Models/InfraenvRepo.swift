/*
 * InfrawrenchSDK v1.124.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.124.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct InfraenvRepo: Codable, Hashable, Sendable {
    public var installationId: Int
    public var fullName: String
    public var defaultBranch: String?

    public init(
        installationId: Int,
        fullName: String,
        defaultBranch: String? = nil
    ) {
        self.installationId = installationId
        self.fullName = fullName
        self.defaultBranch = defaultBranch
    }
}
