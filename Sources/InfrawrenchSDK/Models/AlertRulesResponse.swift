/*
 * InfrawrenchSDK v1.22.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.22.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AlertRulesResponse: Codable, Hashable, Sendable {
    public struct SlackChannel2: Codable, Hashable, Sendable {
        public var id: String
        public var name: String
        public var isPrivate: Bool

        public init(
            id: String,
            name: String,
            isPrivate: Bool
        ) {
            self.id = id
            self.name = name
            self.isPrivate = isPrivate
        }
    }

    public struct MsTeamsWebhook2: Codable, Hashable, Sendable {
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

    public struct Account2: Codable, Hashable, Sendable {
        public var id: String
        public var displayName: String
        public var pluginId: String

        public init(
            id: String,
            displayName: String,
            pluginId: String
        ) {
            self.id = id
            self.displayName = displayName
            self.pluginId = pluginId
        }
    }

    public var rules: [AlertRule]
    /// True when the organization has saved no rules and `rules` is the
    /// synthesized default — everything except drift, to every connected channel
    /// and to mobile push.
    public var usingDefaults: Bool
    public var slackChannels: [SlackChannel2]
    public var msTeamsWebhooks: [MsTeamsWebhook2]
    public var accounts: [Account2]

    public init(
        rules: [AlertRule],
        usingDefaults: Bool,
        slackChannels: [SlackChannel2],
        msTeamsWebhooks: [MsTeamsWebhook2],
        accounts: [Account2]
    ) {
        self.rules = rules
        self.usingDefaults = usingDefaults
        self.slackChannels = slackChannels
        self.msTeamsWebhooks = msTeamsWebhooks
        self.accounts = accounts
    }
}
