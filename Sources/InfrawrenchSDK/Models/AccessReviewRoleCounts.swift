/*
 * InfrawrenchSDK v1.25.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.25.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AccessReviewRoleCounts: Codable, Hashable, Sendable {
    public var user: Int
    public var group: Int
    public var role: Int
    public var serviceAccount: Int
    public var key: Int
    public var binding: Int

    public init(
        user: Int,
        group: Int,
        role: Int,
        serviceAccount: Int,
        key: Int,
        binding: Int
    ) {
        self.user = user
        self.group = group
        self.role = role
        self.serviceAccount = serviceAccount
        self.key = key
        self.binding = binding
    }

    private enum CodingKeys: String, CodingKey {
        case user = "user"
        case group = "group"
        case role = "role"
        case serviceAccount = "service-account"
        case key = "key"
        case binding = "binding"
    }
}
