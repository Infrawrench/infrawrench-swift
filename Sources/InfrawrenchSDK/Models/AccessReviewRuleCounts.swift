/*
 * InfrawrenchSDK v1.18.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.18.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AccessReviewRuleCounts: Codable, Hashable, Sendable {
    public var accessReviewStalePrincipal: Int
    public var accessReviewAdminPrincipal: Int
    public var accessReviewKeyPastRotation: Int
    public var accessReviewNoRecordedOwner: Int
    public var accessReviewNoMfa: Int

    public init(
        accessReviewStalePrincipal: Int,
        accessReviewAdminPrincipal: Int,
        accessReviewKeyPastRotation: Int,
        accessReviewNoRecordedOwner: Int,
        accessReviewNoMfa: Int
    ) {
        self.accessReviewStalePrincipal = accessReviewStalePrincipal
        self.accessReviewAdminPrincipal = accessReviewAdminPrincipal
        self.accessReviewKeyPastRotation = accessReviewKeyPastRotation
        self.accessReviewNoRecordedOwner = accessReviewNoRecordedOwner
        self.accessReviewNoMfa = accessReviewNoMfa
    }

    private enum CodingKeys: String, CodingKey {
        case accessReviewStalePrincipal = "access-review:stale-principal"
        case accessReviewAdminPrincipal = "access-review:admin-principal"
        case accessReviewKeyPastRotation = "access-review:key-past-rotation"
        case accessReviewNoRecordedOwner = "access-review:no-recorded-owner"
        case accessReviewNoMfa = "access-review:no-mfa"
    }
}
