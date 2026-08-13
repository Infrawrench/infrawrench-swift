/*
 * InfrawrenchSDK v1.23.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.23.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct EnvironmentCaptureDraft: Codable, Hashable, Sendable {
    public struct Skipped: Codable, Hashable, Sendable {
        public var resourceId: String
        public var displayName: String
        public var reason: String

        public init(
            resourceId: String,
            displayName: String,
            reason: String
        ) {
            self.resourceId = resourceId
            self.displayName = displayName
            self.reason = reason
        }
    }

    public var members: [EnvironmentCaptureDraftMember]
    public var suggestedParameters: [EnvironmentParameter]
    public var skipped: [Skipped]

    public init(
        members: [EnvironmentCaptureDraftMember],
        suggestedParameters: [EnvironmentParameter],
        skipped: [Skipped]
    ) {
        self.members = members
        self.suggestedParameters = suggestedParameters
        self.skipped = skipped
    }
}
