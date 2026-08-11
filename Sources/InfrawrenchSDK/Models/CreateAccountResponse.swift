/*
 * InfrawrenchSDK v1.9.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.9.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CreateAccountResponse: Codable, Hashable, Sendable {
    public struct SyncError: Codable, Hashable, Sendable {
        public var message: String

        public init(
            message: String
        ) {
            self.message = message
        }
    }

    public var id: String
    public var syncError: SyncError?

    public init(
        id: String,
        syncError: SyncError? = nil
    ) {
        self.id = id
        self.syncError = syncError
    }
}
