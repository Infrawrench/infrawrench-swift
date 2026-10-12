/*
 * InfrawrenchSDK v1.81.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.81.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CompliancePackDeliveryTargets: Codable, Hashable, Sendable {
    public struct SlackChannel2: Codable, Hashable, Sendable {
        public var id: String
        public var label: String

        public init(
            id: String,
            label: String
        ) {
            self.id = id
            self.label = label
        }
    }

    public struct TeamsWebhook: Codable, Hashable, Sendable {
        public var id: String
        public var label: String

        public init(
            id: String,
            label: String
        ) {
            self.id = id
            self.label = label
        }
    }

    public var slackChannels: [SlackChannel2]
    public var teamsWebhooks: [TeamsWebhook]
    public var emailAvailable: Bool

    public init(
        slackChannels: [SlackChannel2],
        teamsWebhooks: [TeamsWebhook],
        emailAvailable: Bool
    ) {
        self.slackChannels = slackChannels
        self.teamsWebhooks = teamsWebhooks
        self.emailAvailable = emailAvailable
    }
}
