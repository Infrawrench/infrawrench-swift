/*
 * InfrawrenchSDK v0.25.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.25.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ProfileSummary: Codable, Hashable, Sendable {
    public var id: String
    public var email: String
    public var emailVerified: Bool
    public var firstName: String?
    public var lastName: String?
    public var profilePictureUrl: String?
    public var lastSignInAt: String?
    public var createdAt: String

    public init(
        id: String,
        email: String,
        emailVerified: Bool,
        firstName: String? = nil,
        lastName: String? = nil,
        profilePictureUrl: String? = nil,
        lastSignInAt: String? = nil,
        createdAt: String
    ) {
        self.id = id
        self.email = email
        self.emailVerified = emailVerified
        self.firstName = firstName
        self.lastName = lastName
        self.profilePictureUrl = profilePictureUrl
        self.lastSignInAt = lastSignInAt
        self.createdAt = createdAt
    }
}
