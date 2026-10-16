/*
 * InfrawrenchSDK v1.82.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.82.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct EventSubscriptionOptions: Codable, Hashable, Sendable {
    public struct Account2: Codable, Hashable, Sendable {
        public var id: String
        public var name: String
        public var pluginId: String

        public init(
            id: String,
            name: String,
            pluginId: String
        ) {
            self.id = id
            self.name = name
            self.pluginId = pluginId
        }
    }

    public struct Sink: Codable, Hashable, Sendable {
        public var accountId: String
        public var accountName: String
        public var pluginId: String
        public var pluginName: String
        public var resourceTypeId: String
        public var resourceTypeName: String
        public var resourceId: String
        public var resourceName: String

        public init(
            accountId: String,
            accountName: String,
            pluginId: String,
            pluginName: String,
            resourceTypeId: String,
            resourceTypeName: String,
            resourceId: String,
            resourceName: String
        ) {
            self.accountId = accountId
            self.accountName = accountName
            self.pluginId = pluginId
            self.pluginName = pluginName
            self.resourceTypeId = resourceTypeId
            self.resourceTypeName = resourceTypeName
            self.resourceId = resourceId
            self.resourceName = resourceName
        }
    }

    public var accounts: [Account2]
    public var environments: [String]
    public var sinks: [Sink]
    public var canSubscribeToCost: Bool

    public init(
        accounts: [Account2],
        environments: [String],
        sinks: [Sink],
        canSubscribeToCost: Bool
    ) {
        self.accounts = accounts
        self.environments = environments
        self.sinks = sinks
        self.canSubscribeToCost = canSubscribeToCost
    }
}
