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

public struct ServiceDetail: Codable, Hashable, Sendable {
    public var service: Service
    public var members: [ServiceMember]
    /// Rule-matched resources the service deliberately leaves out.
    public var excluded: [ServiceMember]

    public init(
        service: Service,
        members: [ServiceMember],
        excluded: [ServiceMember]
    ) {
        self.service = service
        self.members = members
        self.excluded = excluded
    }
}
