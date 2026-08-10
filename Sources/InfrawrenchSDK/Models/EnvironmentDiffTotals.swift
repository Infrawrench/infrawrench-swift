/*
 * InfrawrenchSDK v1.4.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.4.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct EnvironmentDiffTotals: Codable, Hashable, Sendable {
    public var onlyInA: Int
    public var onlyInB: Int
    public var changed: Int
    public var identical: Int
    public var typesOnlyInA: Int
    public var typesOnlyInB: Int
    /// Field divergences the identity filter hid across every pair.
    public var suppressedFieldChanges: Int

    public init(
        onlyInA: Int,
        onlyInB: Int,
        changed: Int,
        identical: Int,
        typesOnlyInA: Int,
        typesOnlyInB: Int,
        suppressedFieldChanges: Int
    ) {
        self.onlyInA = onlyInA
        self.onlyInB = onlyInB
        self.changed = changed
        self.identical = identical
        self.typesOnlyInA = typesOnlyInA
        self.typesOnlyInB = typesOnlyInB
        self.suppressedFieldChanges = suppressedFieldChanges
    }
}
