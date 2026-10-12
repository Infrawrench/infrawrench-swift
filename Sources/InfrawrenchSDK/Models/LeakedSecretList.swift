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

public struct LeakedSecretList: Codable, Hashable, Sendable {
    public struct Counts: Codable, Hashable, Sendable {
        public var open: Int
        public var rotated: Int
        public var dismissed: Int
        public var resolved: Int

        public init(
            open: Int,
            rotated: Int,
            dismissed: Int,
            resolved: Int
        ) {
            self.open = open
            self.rotated = rotated
            self.dismissed = dismissed
            self.resolved = resolved
        }
    }

    /// Open first, newest first within a status. At most 500.
    public var leaks: [LeakedSecret]
    public var counts: Counts
    public var scanners: [LeakedSecretScanner]
    public var generatedAt: String

    public init(
        leaks: [LeakedSecret],
        counts: Counts,
        scanners: [LeakedSecretScanner],
        generatedAt: String
    ) {
        self.leaks = leaks
        self.counts = counts
        self.scanners = scanners
        self.generatedAt = generatedAt
    }
}
