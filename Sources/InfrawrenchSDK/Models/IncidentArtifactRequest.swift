/*
 * InfrawrenchSDK v1.31.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.31.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// What the declaration asked for, recorded so a retry asks for the same thing.
/// Present on the status-page artefact, where a retry that forgot the operator's
/// chosen components would publish the outage against the whole page.
///
/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct IncidentArtifactRequest: Codable, Hashable, Sendable {
    public var statusPageId: String?
    public var componentIds: [String]?

    public init(
        statusPageId: String? = nil,
        componentIds: [String]? = nil
    ) {
        self.statusPageId = statusPageId
        self.componentIds = componentIds
    }
}
