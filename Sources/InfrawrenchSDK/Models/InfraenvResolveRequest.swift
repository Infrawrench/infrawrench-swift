/*
 * InfrawrenchSDK v1.124.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.124.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct InfraenvResolveRequest: Codable, Hashable, Sendable {
    /// The `.infraenv` file's text.
    public var source: String
    public var environment: String?
    /// The file's path, named in the generated `.env` header. Defaults to
    /// `.infraenv`.
    public var sourceName: String?

    public init(
        source: String,
        environment: String? = nil,
        sourceName: String? = nil
    ) {
        self.source = source
        self.environment = environment
        self.sourceName = sourceName
    }
}
