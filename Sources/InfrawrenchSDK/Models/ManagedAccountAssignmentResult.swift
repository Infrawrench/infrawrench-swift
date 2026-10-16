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

public struct ManagedAccountAssignmentResult: Codable, Hashable, Sendable {
    public struct Change: Codable, Hashable, Sendable {
        public struct Before: Codable, Hashable, Sendable {
            public var costCentreIds: [String]
            public var accountIds: [String]

            public init(
                costCentreIds: [String],
                accountIds: [String]
            ) {
                self.costCentreIds = costCentreIds
                self.accountIds = accountIds
            }
        }

        public struct After: Codable, Hashable, Sendable {
            public var costCentreIds: [String]
            public var accountIds: [String]

            public init(
                costCentreIds: [String],
                accountIds: [String]
            ) {
                self.costCentreIds = costCentreIds
                self.accountIds = accountIds
            }
        }

        public var id: String
        public var name: String
        public var before: Before
        public var after: After

        public init(
            id: String,
            name: String,
            before: Before,
            after: After
        ) {
            self.id = id
            self.name = name
            self.before = before
            self.after = after
        }
    }

    public var changes: [Change]
    public var accounts: [ManagedAccount]

    public init(
        changes: [Change],
        accounts: [ManagedAccount]
    ) {
        self.changes = changes
        self.accounts = accounts
    }
}
