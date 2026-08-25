/*
 * InfrawrenchSDK v1.35.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.35.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SharedConsolesHandoverBody: Codable, Hashable, Sendable {
    public var participantId: String

    public init(
        participantId: String
    ) {
        self.participantId = participantId
    }
}

public struct SharedConsolesJoinBody: Codable, Hashable, Sendable {
    public var token: String

    public init(
        token: String
    ) {
        self.token = token
    }
}

public struct SharedConsolesInvitesCreateBody: Codable, Hashable, Sendable {
    public var inviteTtlMinutes: Int?

    public init(
        inviteTtlMinutes: Int? = nil
    ) {
        self.inviteTtlMinutes = inviteTtlMinutes
    }
}

/// `client.sharedConsoles`
public final class SharedConsolesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.sharedConsoles.invites`
    public let invites: SharedConsolesInvitesNamespace
    /// `client.sharedConsoles.participants`
    public let participants: SharedConsolesParticipantsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.invites = SharedConsolesInvitesNamespace(transport: transport)
        self.participants = SharedConsolesParticipantsNamespace(transport: transport)
    }

    /// Share a live SSH session
    ///
    /// Opens a share on a session you already have running and mints its first
    /// invite. You become the driver.
    ///
    /// Returns 409 `console_not_here` when the pty is held by a different server
    /// replica than the one answering this call — reopen the terminal and share
    /// again. Writing the share anyway would produce a link that authorises
    /// correctly and then finds nothing to attach to.
    ///
    /// Requires `resources:execute` — the same permission as opening the
    /// terminal. Closed to API keys: sharing a shell is an act a person performs.
    ///
    /// _Requires permission: `resources:execute`._
    ///
    /// POST /api/org/{orgId}/shared-consoles
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: CreateSharedConsole? = nil,
        options: RequestOptions? = nil
    ) async throws -> SharedConsoleCreated {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/shared-consoles",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Revoke a share
    ///
    /// Disconnects every guest and stops the fan-out. The sharer's own SSH
    /// session carries on — revoking a share is not killing a terminal.
    ///
    /// The sharer or a holder of `org:settings:write`. Deliberately does **not**
    /// require `resources:execute`: ending access must never be gated on still
    /// holding the access, or an owner whose role was narrowed mid-incident could
    /// not close the session they opened.
    ///
    /// DELETE /api/org/{orgId}/shared-consoles/{consoleId}
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        consoleId: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/shared-consoles/{consoleId}",
                pathParameters: ["orgId": orgId?.parameterValue, "consoleId": consoleId.parameterValue]
            ),
            options: options
        )
    }

    /// Get one shared console
    ///
    /// Visible to participants and to anyone who could revoke it (the sharer, or
    /// a holder of `org:settings:write`). Others get 404 — that a named colleague
    /// has a root shell open on a named production host right now is operational
    /// information.
    ///
    /// _Requires permission: `resources:execute`._
    ///
    /// GET /api/org/{orgId}/shared-consoles/{consoleId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        consoleId: String,
        options: RequestOptions? = nil
    ) async throws -> SharedConsoleState {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/shared-consoles/{consoleId}",
                pathParameters: ["orgId": orgId?.parameterValue, "consoleId": consoleId.parameterValue]
            ),
            options: options
        )
    }

    /// Move the keyboard to another participant
    ///
    /// Authorised by the **current driver** (the keyboard is theirs to give) or
    /// by the **sharer** (it is their box, and asking permission from somebody
    /// who has stopped responding is not a control). An observer cannot promote
    /// themselves — that is `/request-driver`.
    ///
    /// Two simultaneous grants cannot both win: the database's partial unique
    /// index decides the order, and the loser gets 409 `driver-race-lost`.
    ///
    /// The pty resizes to the new driver's viewport; everyone else letterboxes.
    ///
    /// _Requires permission: `resources:execute`._
    ///
    /// POST /api/org/{orgId}/shared-consoles/{consoleId}/handover
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func handover(
        orgId: String? = nil,
        consoleId: String,
        body: SharedConsolesHandoverBody? = nil,
        options: RequestOptions? = nil
    ) async throws -> SharedConsoleState {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/shared-consoles/{consoleId}/handover",
                pathParameters: ["orgId": orgId?.parameterValue, "consoleId": consoleId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Redeem an invite and join
    ///
    /// Admission needs live org membership **and** `resources:execute` — the
    /// invite is a locator, never a capability, so a leaked link admits nobody
    /// who could not have opened the shell themselves.
    ///
    /// The invite is consumed by the first person it admits. Somebody already on
    /// the console resumes their own row without a token, so a reload costs them
    /// nothing and obliges the sharer to mint nothing. New joiners always start
    /// as observers whatever the link said.
    ///
    /// Audit-logged as `shared_console.join`, and written onto the recording's
    /// timeline as an asciicast marker.
    ///
    /// _Requires permission: `resources:execute`._
    ///
    /// POST /api/org/{orgId}/shared-consoles/{consoleId}/join
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func join(
        orgId: String? = nil,
        consoleId: String,
        body: SharedConsolesJoinBody? = nil,
        options: RequestOptions? = nil
    ) async throws -> SharedConsoleJoined {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/shared-consoles/{consoleId}/join",
                pathParameters: ["orgId": orgId?.parameterValue, "consoleId": consoleId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Leave a shared console
    ///
    /// Steps you off without ending the session. Your row survives, so the same
    /// invite is not needed again. Deliberately does not require
    /// `resources:execute`: giving access up must never be gated on still holding
    /// it.
    ///
    /// POST /api/org/{orgId}/shared-consoles/{consoleId}/leave
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func leave(
        orgId: String? = nil,
        consoleId: String,
        options: RequestOptions? = nil
    ) async throws -> SharedConsoleState {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/shared-consoles/{consoleId}/leave",
                pathParameters: ["orgId": orgId?.parameterValue, "consoleId": consoleId.parameterValue]
            ),
            options: options
        )
    }

    /// List sessions currently shared
    ///
    /// Live shared SSH sessions in this organization, with who is on each. Only
    /// cloud SSH can be shared: those sessions are already proxied by the server,
    /// so fanning the pty out to a second socket is a consumer of a stream it
    /// holds. A desktop session dialling a host directly never reaches the server
    /// and cannot be shared.
    ///
    /// _Requires permission: `resources:execute`._
    ///
    /// GET /api/org/{orgId}/shared-consoles
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [SharedConsoleSummary] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/shared-consoles",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Ask for the keyboard
    ///
    /// Raises a flag the driver and the sharer can see. Grants nothing on its own
    /// — that is the point.
    ///
    /// _Requires permission: `resources:execute`._
    ///
    /// POST /api/org/{orgId}/shared-consoles/{consoleId}/request-driver
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func requestDriver(
        orgId: String? = nil,
        consoleId: String,
        options: RequestOptions? = nil
    ) async throws -> SharedConsoleState {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/shared-consoles/{consoleId}/request-driver",
                pathParameters: ["orgId": orgId?.parameterValue, "consoleId": consoleId.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.sharedConsoles.invites`
public final class SharedConsolesInvitesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Mint a replacement invite
    ///
    /// An invite is spent by the first person it admits, so inviting a second
    /// guest means minting a second link. Replaces any outstanding one. Sharer or
    /// `org:settings:write`.
    ///
    /// POST /api/org/{orgId}/shared-consoles/{consoleId}/invites
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        consoleId: String,
        body: SharedConsolesInvitesCreateBody? = nil,
        options: RequestOptions? = nil
    ) async throws -> SharedConsoleCreated {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/shared-consoles/{consoleId}/invites",
                pathParameters: ["orgId": orgId?.parameterValue, "consoleId": consoleId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Withdraw the outstanding invite
    ///
    /// Kills the link without touching the session or anyone already on it.
    ///
    /// DELETE /api/org/{orgId}/shared-consoles/{consoleId}/invites
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        consoleId: String,
        options: RequestOptions? = nil
    ) async throws -> SharedConsoleState {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/shared-consoles/{consoleId}/invites",
                pathParameters: ["orgId": orgId?.parameterValue, "consoleId": consoleId.parameterValue]
            ),
            options: options
        )
    }

    /// Preview what an invite link points at
    ///
    /// What the join screen shows before anyone commits: which host, whose
    /// session, and whether you may join it. Reachable with a valid token by a
    /// signed-in member who already holds `resources:execute` — the token says
    /// *which* session, never *whether*. Returns nothing from the session itself.
    ///
    /// _Requires permission: `resources:execute`._
    ///
    /// GET /api/org/{orgId}/shared-consoles/invites/{token}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        token: String,
        options: RequestOptions? = nil
    ) async throws -> SharedConsoleInvitePreview {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/shared-consoles/invites/{token}",
                pathParameters: ["orgId": orgId?.parameterValue, "token": token.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.sharedConsoles.participants`
public final class SharedConsolesParticipantsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Remove somebody from a shared console
    ///
    /// Their socket is closed immediately on the replica holding the pty, and
    /// within one two-second sweep on any other. They are marked `removed` rather
    /// than `left`, so they cannot resume without a fresh invite. The sharer
    /// cannot be removed — revoke the share.
    ///
    /// DELETE
    /// /api/org/{orgId}/shared-consoles/{consoleId}/participants/{participantId}
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        consoleId: String,
        participantId: String,
        options: RequestOptions? = nil
    ) async throws -> SharedConsoleState {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/shared-consoles/{consoleId}/participants/{participantId}",
                pathParameters: ["orgId": orgId?.parameterValue, "consoleId": consoleId.parameterValue, "participantId": participantId.parameterValue]
            ),
            options: options
        )
    }
}
