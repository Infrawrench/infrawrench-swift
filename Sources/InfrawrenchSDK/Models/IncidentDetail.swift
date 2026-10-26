/*
 * InfrawrenchSDK v1.84.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.84.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct IncidentDetail: Codable, Hashable, Sendable {
    public struct AffectedService: Codable, Hashable, Sendable {
        public var id: String
        public var name: String
        public var slug: String
        public var tier: Double?

        public init(
            id: String,
            name: String,
            slug: String,
            tier: Double? = nil
        ) {
            self.id = id
            self.name = name
            self.slug = slug
            self.tier = tier
        }
    }

    public var incident: Incident
    public var notes: [IncidentNote]
    /// Services the affected resources belong to, resolved on read.
    public var affectedServices: [AffectedService]

    public init(
        incident: Incident,
        notes: [IncidentNote],
        affectedServices: [AffectedService]
    ) {
        self.incident = incident
        self.notes = notes
        self.affectedServices = affectedServices
    }
}
