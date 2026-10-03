/*
 * InfrawrenchSDK v1.42.2 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.42.2).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SshInstallResult: Codable, Hashable, Sendable {
    public var message: String
    public var address: String?
    public var warnings: [String]?
    /// Opaque, plugin-owned handle to what was installed (e.g. a tailnet device
    /// id).
    public var ref: String?

    public init(
        message: String,
        address: String? = nil,
        warnings: [String]? = nil,
        ref: String? = nil
    ) {
        self.message = message
        self.address = address
        self.warnings = warnings
        self.ref = ref
    }
}
