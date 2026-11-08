/*
 * InfrawrenchSDK v1.98.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.98.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SyncResponse: Codable, Hashable, Sendable {
    public struct IncompleteList: Codable, Hashable, Sendable {
        public var resourceTypeId: String
        public var message: String

        public init(
            resourceTypeId: String,
            message: String
        ) {
            self.resourceTypeId = resourceTypeId
            self.message = message
        }
    }

    public var synced: Int
    /// Resource types left as they were because their list could not be read
    /// whole: too long to read, or a page from the provider that was not a list.
    /// The stored rows are kept rather than pruned against part of a list.
    public var incompleteLists: [IncompleteList]?

    public init(
        synced: Int,
        incompleteLists: [IncompleteList]? = nil
    ) {
        self.synced = synced
        self.incompleteLists = incompleteLists
    }
}
