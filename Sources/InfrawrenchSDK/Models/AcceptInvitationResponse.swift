/*
 * InfrawrenchSDK v1.14.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.14.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AcceptInvitationResponse: Codable, Hashable, Sendable {
    public struct Organization2: Codable, Hashable, Sendable {
        public var id: String
        public var displayName: String

        public init(
            id: String,
            displayName: String
        ) {
            self.id = id
            self.displayName = displayName
        }
    }

    public var organization: Organization2

    public init(
        organization: Organization2
    ) {
        self.organization = organization
    }
}
