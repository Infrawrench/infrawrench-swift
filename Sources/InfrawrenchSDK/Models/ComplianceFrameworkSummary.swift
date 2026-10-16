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

public struct ComplianceFrameworkSummary: Codable, Hashable, Sendable {
    /// Framework registry id: `soc2` or `iso27001`.
    public var id: String
    public var name: String
    public var version: String
    public var description: String
    /// Which controls the registry covers and which need outside evidence.
    public var scopeNote: String
    public var controlCount: Int

    public init(
        id: String,
        name: String,
        version: String,
        description: String,
        scopeNote: String,
        controlCount: Int
    ) {
        self.id = id
        self.name = name
        self.version = version
        self.description = description
        self.scopeNote = scopeNote
        self.controlCount = controlCount
    }
}
