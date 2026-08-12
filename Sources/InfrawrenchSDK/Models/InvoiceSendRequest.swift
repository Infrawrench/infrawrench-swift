/*
 * InfrawrenchSDK v1.22.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.22.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct InvoiceSendRequest: Codable, Hashable, Sendable {
    /// Send another copy of an invoice that has already reached somebody.
    /// Required only in that case: retrying a delivery that reached nobody
    /// (`failed`, `no_targets`) needs no flag, because there is no inbox to
    /// duplicate into. Refused with 409 without it when the last attempt landed,
    /// or when its outcome is unknown (`pending`).
    public var resend: Bool?

    public init(
        resend: Bool? = nil
    ) {
        self.resend = resend
    }
}
