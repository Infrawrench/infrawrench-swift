/*
 * InfrawrenchSDK v1.37.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.37.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BackupKindCounts: Codable, Hashable, Sendable {
    public var unprotected: Int
    public var rpoBreach: Int
    public var retentionBelowPolicy: Int
    public var orphanedSnapshot: Int

    public init(
        unprotected: Int,
        rpoBreach: Int,
        retentionBelowPolicy: Int,
        orphanedSnapshot: Int
    ) {
        self.unprotected = unprotected
        self.rpoBreach = rpoBreach
        self.retentionBelowPolicy = retentionBelowPolicy
        self.orphanedSnapshot = orphanedSnapshot
    }

    private enum CodingKeys: String, CodingKey {
        case unprotected = "unprotected"
        case rpoBreach = "rpo-breach"
        case retentionBelowPolicy = "retention-below-policy"
        case orphanedSnapshot = "orphaned-snapshot"
    }
}
