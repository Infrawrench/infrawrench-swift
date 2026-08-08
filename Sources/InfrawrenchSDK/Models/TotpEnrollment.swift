/*
 * InfrawrenchSDK v1.1.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.1.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct TotpEnrollment: Codable, Hashable, Sendable {
    public var factorId: String
    public var challengeId: String
    /// Data-URI image of the enrolment QR code
    public var qrCode: String?
    /// Base32 secret, for manual entry
    public var secret: String?
    /// `otpauth://` URI
    public var uri: String?

    public init(
        factorId: String,
        challengeId: String,
        qrCode: String? = nil,
        secret: String? = nil,
        uri: String? = nil
    ) {
        self.factorId = factorId
        self.challengeId = challengeId
        self.qrCode = qrCode
        self.secret = secret
        self.uri = uri
    }
}
