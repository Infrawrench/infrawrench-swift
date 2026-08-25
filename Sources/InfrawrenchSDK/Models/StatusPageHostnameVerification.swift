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

/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct StatusPageHostnameVerification: Codable, Hashable, Sendable {
    /// Target of the customer's CNAME (e.g. statuspages.infrawrench.com).
    public var cnameTarget: String
    /// Ownership TXT name, when Cloudflare asked for one.
    public var txtName: String?
    /// Ownership TXT value, when Cloudflare asked for one.
    public var txtValue: String?

    public init(
        cnameTarget: String,
        txtName: String? = nil,
        txtValue: String? = nil
    ) {
        self.cnameTarget = cnameTarget
        self.txtName = txtName
        self.txtValue = txtValue
    }
}
