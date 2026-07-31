/*
 * InfrawrenchSDK v0.20.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.20.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ProfilePasswordResetResult: Codable, Hashable, Sendable {
    public var passwordResetUrl: String
    public var expiresAt: String

    public init(
        passwordResetUrl: String,
        expiresAt: String
    ) {
        self.passwordResetUrl = passwordResetUrl
        self.expiresAt = expiresAt
    }
}

public struct ProfileUpdateBody: Codable, Hashable, Sendable {
    public var firstName: String?
    public var lastName: String?

    public init(
        firstName: String? = nil,
        lastName: String? = nil
    ) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

public struct ProfileEmailChangeConfirmBody: Codable, Hashable, Sendable {
    public var code: String

    public init(
        code: String
    ) {
        self.code = code
    }
}

public struct ProfileEmailChangeConfirmResult: Codable, Hashable, Sendable {
    public var email: String

    public init(
        email: String
    ) {
        self.email = email
    }
}

public struct ProfileEmailChangeCreateBody: Codable, Hashable, Sendable {
    public var newEmail: String

    public init(
        newEmail: String
    ) {
        self.newEmail = newEmail
    }
}

public struct ProfileEmailChangeCreateResult: Codable, Hashable, Sendable {
    public var newEmail: String
    public var expiresAt: String

    public init(
        newEmail: String,
        expiresAt: String
    ) {
        self.newEmail = newEmail
        self.expiresAt = expiresAt
    }
}

public struct ProfileMfaChallengeResult: Codable, Hashable, Sendable {
    public var challengeId: String

    public init(
        challengeId: String
    ) {
        self.challengeId = challengeId
    }
}

public struct ProfileMfaVerifyBody: Codable, Hashable, Sendable {
    public var challengeId: String
    public var code: String

    public init(
        challengeId: String,
        code: String
    ) {
        self.challengeId = challengeId
        self.code = code
    }
}

public struct ProfileMfaVerifyResult: Codable, Hashable, Sendable {
    public var verified: Bool

    public init(
        verified: Bool
    ) {
        self.verified = verified
    }
}

public struct ProfileSessionsRevokeOthersResult: Codable, Hashable, Sendable {
    public var revoked: Int

    public init(
        revoked: Int
    ) {
        self.revoked = revoked
    }
}

/// `client.profile`
public final class ProfileNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.profile.emailChange`
    public let emailChange: ProfileEmailChangeNamespace
    /// `client.profile.mfa`
    public let mfa: ProfileMfaNamespace
    /// `client.profile.sessions`
    public let sessions: ProfileSessionsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.emailChange = ProfileEmailChangeNamespace(transport: transport)
        self.mfa = ProfileMfaNamespace(transport: transport)
        self.sessions = ProfileSessionsNamespace(transport: transport)
    }

    /// Delete the signed-in user's account
    ///
    /// Irreversible. Organizations where the caller is the only member are
    /// deleted and their subscriptions cancelled; other memberships are simply
    /// removed. Refuses with `transfer_ownership_required` while the caller is
    /// the only owner of an organization other people belong to.
    ///
    /// DELETE /api/profile
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 403: Recent sign-in required. Send the user through sign-in
    /// again and retry; the request itself was well-formed.
    ///
    /// Raises on 409: The caller still solely owns a shared organization; nothing
    /// was deleted.
    ///
    /// Raises on 502: A subscription could not be cancelled; nothing was deleted.
    public func delete(
        options: RequestOptions? = nil
    ) async throws -> AccountDeleted {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/profile"
            ),
            options: options
        )
    }

    /// What deleting this account would do
    ///
    /// Read-only. Lets a confirmation screen name the organizations that go with
    /// the account, and the ones that must be handed over first.
    ///
    /// GET /api/profile/deletion-preview
    ///
    /// Raises on 401: Unauthenticated
    public func deletionPreview(
        options: RequestOptions? = nil
    ) async throws -> AccountDeletionPreview {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/profile/deletion-preview"
            ),
            options: options
        )
    }

    /// The signed-in user's account profile
    ///
    /// User-scoped, not organization-scoped: one WorkOS identity is shared across
    /// every organization the user belongs to.
    ///
    /// GET /api/profile
    ///
    /// Raises on 401: Unauthenticated
    public func get(
        options: RequestOptions? = nil
    ) async throws -> Profile {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/profile"
            ),
            options: options
        )
    }

    /// Mint a password reset link for the signed-in user
    ///
    /// Returns a one-time AuthKit-hosted reset URL rather than emailing it — the
    /// caller already holds a valid session for the account. Also the way to set
    /// a first password on an SSO or OAuth-only account.
    ///
    /// POST /api/profile/password-reset
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 403: Recent sign-in required. Send the user through sign-in
    /// again and retry; the request itself was well-formed.
    public func passwordReset(
        options: RequestOptions? = nil
    ) async throws -> ProfilePasswordResetResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/profile/password-reset"
            ),
            options: options
        )
    }

    /// Re-send the email verification message
    ///
    /// POST /api/profile/send-verification-email
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 401: Unauthenticated
    public func sendVerificationEmail(
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/profile/send-verification-email"
            ),
            options: options
        )
    }

    /// Update the signed-in user's name
    ///
    /// PATCH /api/profile
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 401: Unauthenticated
    public func update(
        body: ProfileUpdateBody? = nil,
        options: RequestOptions? = nil
    ) async throws -> ProfileSummary {
        return try await transport.send(
            RequestSpec(
                method: "PATCH",
                path: "/api/profile",
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}

/// `client.profile.emailChange`
public final class ProfileEmailChangeNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Redeem an email change code
    ///
    /// On success the account's email is the new address and it is marked
    /// verified.
    ///
    /// POST /api/profile/email-change/confirm
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 403: Recent sign-in required. Send the user through sign-in
    /// again and retry; the request itself was well-formed.
    public func confirm(
        body: ProfileEmailChangeConfirmBody? = nil,
        options: RequestOptions? = nil
    ) async throws -> ProfileEmailChangeConfirmResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/profile/email-change/confirm",
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Send a confirmation code to a new email address
    ///
    /// Starts an email change. The code goes to the new address and the account
    /// keeps its current address until `/api/profile/email-change/confirm`
    /// redeems it, so an abandoned or mistyped change is harmless.
    ///
    /// POST /api/profile/email-change
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 403: Recent sign-in required. Send the user through sign-in
    /// again and retry; the request itself was well-formed.
    public func create(
        body: ProfileEmailChangeCreateBody? = nil,
        options: RequestOptions? = nil
    ) async throws -> ProfileEmailChangeCreateResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/profile/email-change",
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}

/// `client.profile.mfa`
public final class ProfileMfaNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Issue a fresh challenge for a factor
    ///
    /// POST /api/profile/mfa/{factorId}/challenge
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 404: Not found
    public func challenge(
        factorId: String,
        options: RequestOptions? = nil
    ) async throws -> ProfileMfaChallengeResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/profile/mfa/{factorId}/challenge",
                pathParameters: ["factorId": factorId.parameterValue]
            ),
            options: options
        )
    }

    /// Begin TOTP enrolment
    ///
    /// Creates the factor and a first challenge. The factor only becomes usable
    /// once a code is verified; abandon the flow by DELETEing the returned
    /// `factorId`.
    ///
    /// POST /api/profile/mfa
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 403: Recent sign-in required. Send the user through sign-in
    /// again and retry; the request itself was well-formed.
    public func create(
        options: RequestOptions? = nil
    ) async throws -> TotpEnrollment {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/profile/mfa"
            ),
            options: options
        )
    }

    /// Remove an authentication factor
    ///
    /// DELETE /api/profile/mfa/{factorId}
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 403: Recent sign-in required. Send the user through sign-in
    /// again and retry; the request itself was well-formed.
    ///
    /// Raises on 404: Not found
    public func delete(
        factorId: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/profile/mfa/{factorId}",
                pathParameters: ["factorId": factorId.parameterValue]
            ),
            options: options
        )
    }

    /// List enrolled authentication factors
    ///
    /// Includes factors whose enrolment was never confirmed — WorkOS does not
    /// expose a verified flag.
    ///
    /// GET /api/profile/mfa
    ///
    /// Raises on 401: Unauthenticated
    public func list(
        options: RequestOptions? = nil
    ) async throws -> [AuthFactor] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/profile/mfa"
            ),
            options: options
        )
    }

    /// Verify a code against a challenge
    ///
    /// POST /api/profile/mfa/{factorId}/verify
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 404: Not found
    public func verify(
        factorId: String,
        body: ProfileMfaVerifyBody? = nil,
        options: RequestOptions? = nil
    ) async throws -> ProfileMfaVerifyResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/profile/mfa/{factorId}/verify",
                pathParameters: ["factorId": factorId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}

/// `client.profile.sessions`
public final class ProfileSessionsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Revoke one session
    ///
    /// Refuses the session making the request — use sign-out for that.
    ///
    /// DELETE /api/profile/sessions/{sessionId}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 404: Not found
    public func delete(
        sessionId: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/profile/sessions/{sessionId}",
                pathParameters: ["sessionId": sessionId.parameterValue]
            ),
            options: options
        )
    }

    /// List the signed-in user's active sessions
    ///
    /// GET /api/profile/sessions
    ///
    /// Raises on 401: Unauthenticated
    public func list(
        options: RequestOptions? = nil
    ) async throws -> [UserSession] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/profile/sessions"
            ),
            options: options
        )
    }

    /// Revoke every session except the current one
    ///
    /// POST /api/profile/sessions/revoke-others
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 403: Recent sign-in required. Send the user through sign-in
    /// again and retry; the request itself was well-formed.
    public func revokeOthers(
        options: RequestOptions? = nil
    ) async throws -> ProfileSessionsRevokeOthersResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/profile/sessions/revoke-others"
            ),
            options: options
        )
    }
}
