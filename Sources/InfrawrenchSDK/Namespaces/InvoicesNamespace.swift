/*
 * InfrawrenchSDK v1.19.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.19.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.invoices`
public final class InvoicesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Approve an invoice — freeze its figures
    ///
    /// Computes the figures one last time and writes them onto the invoice
    /// together with the exchange rates, the day they were read, the billing
    /// rules in force and the names everything in scope had. From here the
    /// invoice is a document, not a query.
    ///
    /// A distinct act from generation, on a distinct permission
    /// (`invoices:issue`), with its own audit entry recording who approved what.
    ///
    /// Refused with 409 when a currency in the invoice has no stated exchange
    /// rate: an approved invoice has to be quotable as one number in the
    /// customer's currency.
    ///
    /// Refused with 409, too, when the draft or its customer changed while the
    /// figures were being computed — a different period, scope, currency, cost
    /// basis or billing-rules setting. Nothing is approved in that case: freezing
    /// figures that describe a different question would be worse than making the
    /// caller look again.
    ///
    /// _Requires permission: `invoices:issue`._
    ///
    /// POST /api/org/{orgId}/invoices/{id}/approve
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func approve(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> Invoice {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/invoices/{id}/approve",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Raise a draft invoice
    ///
    /// Always lands in `draft`. Generating and issuing are two acts on two
    /// permissions: a mistyped period must not be able to reach a customer
    /// without anyone having read the numbers.
    ///
    /// _Requires permission: `invoices:write`._
    ///
    /// POST /api/org/{orgId}/invoices
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
        body: InvoiceInput,
        options: RequestOptions? = nil
    ) async throws -> Invoice {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/invoices",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a draft invoice
    ///
    /// Draft only, and refused with 409 otherwise. An issued invoice is voided;
    /// deleting one would erase a document a customer holds a copy of.
    ///
    /// _Requires permission: `invoices:write`._
    ///
    /// DELETE /api/org/{orgId}/invoices/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/invoices/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Download an invoice as CSV
    ///
    /// The derivation, not a rendered document: what was collected, what the
    /// rules added, the rate and the day it was read, and the final figure —
    /// every column an accounts-payable clerk needs to check the arithmetic. Same
    /// RFC 4180 quoting as the scheduled cost exports.
    ///
    /// _Requires permission: `invoices:read`._
    ///
    /// GET /api/org/{orgId}/invoices/{id}/export
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func export(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> Data {
        return try await transport.sendData(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/invoices/{id}/export",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Get an invoice
    ///
    /// **A draft recomputes from live spend; an approved, sent or void invoice
    /// does not.** `live` says which happened. A frozen invoice returns the
    /// figures written at approval and does not read cost data at all.
    ///
    /// _Requires permission: `invoices:read`._
    ///
    /// GET /api/org/{orgId}/invoices/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> Invoice {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/invoices/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List invoices
    ///
    /// Summaries, newest period first. A draft's `totals` is null here rather
    /// than recomputed — recomputing every draft would make opening the list one
    /// cost-data scan per draft, and zero would be a lie the reader cannot
    /// detect.
    ///
    /// _Requires permission: `invoices:read`._
    ///
    /// GET /api/org/{orgId}/invoices
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        managedAccountId: String? = nil,
        status: InvoiceStatus? = nil,
        options: RequestOptions? = nil
    ) async throws -> [InvoiceSummary] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/invoices",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("managedAccountId", managedAccountId), QueryParameter("status", status)]
            ),
            options: options
        )
    }

    /// Send an invoice to its customer
    ///
    /// Changes no figure — the document was frozen at approval. It records the
    /// **release** (this may go to the customer, and this person said so), then
    /// emails the invoice to the customer's contact addresses with the CSV
    /// attached.
    ///
    /// **200 even when delivery failed.** The release happened and is recorded
    /// either way; `delivery` says what became of the transport. An error status
    /// would leave the caller unable to tell which of the two failed. A failed
    /// delivery is visible, and re-sending retries it.
    ///
    /// Sending again needs `resend: true` only when the last attempt reached
    /// somebody — see `InvoiceSendRequest`. The body may be omitted entirely for
    /// a first send.
    ///
    /// _Requires permission: `invoices:issue`._
    ///
    /// POST /api/org/{orgId}/invoices/{id}/send
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func send(
        orgId: String? = nil,
        id: String,
        body: InvoiceSendRequest? = nil,
        options: RequestOptions? = nil
    ) async throws -> Invoice {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/invoices/{id}/send",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Edit a draft invoice
    ///
    /// Draft only. An approved, sent or void invoice is refused with 409 by the
    /// service, not merely hidden by the UI — an issued invoice that silently
    /// changed after the customer received it is the worst outcome this feature
    /// could produce.
    ///
    /// _Requires permission: `invoices:write`._
    ///
    /// PUT /api/org/{orgId}/invoices/{id}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        id: String,
        body: InvoiceUpdate,
        options: RequestOptions? = nil
    ) async throws -> Invoice {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/invoices/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Void an issued invoice
    ///
    /// The only correction there is. The original keeps every figure it was sent
    /// with — “we billed you this, it was wrong, here is the corrected one” is a
    /// story a customer can follow, and “we changed the invoice” is not.
    ///
    /// With `supersede`, the void, the corrective draft and both directions of
    /// the link between them are one transaction. Void is irreversible, so a
    /// half-applied correction would leave a withdrawn invoice with no way
    /// forward; this call either applies whole or not at all.
    ///
    /// _Requires permission: `invoices:issue`._
    ///
    /// POST /api/org/{orgId}/invoices/{id}/void
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func void(
        orgId: String? = nil,
        id: String,
        body: InvoiceVoidRequest,
        options: RequestOptions? = nil
    ) async throws -> InvoiceVoidResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/invoices/{id}/void",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
