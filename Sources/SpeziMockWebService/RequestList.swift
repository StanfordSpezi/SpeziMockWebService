//
// This source file is part of the Stanford Spezi open-source project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

import SwiftUI


/// Displays the recoded uploads collected by the ``MockWebService``.
///
/// @Row {
///     @Column {
///         @Image(source: "Overview", alt: "Screenshot showing an empty list with a placeholder stating: \"The Mock Web Service will display all requests that would be triggered by the application.\".") {
///             The landing page of the ``RequestList``.
///         }
///     }
///     @Column {
///         @Image(source: "Requests", alt: "Screenshot showing two requests in the mock request list: One is a deletion request, and one is an addition.") {
///             The ``RequestList`` provides an overview of all sent requests.
///         }
///     }
///     @Column {
///         @Image(source: "Request", alt: "Detail view of a mock request, showing that it is an addition with a short JSON body.") {
///             The detail view of a single request.
///         }
///     }
/// }
///
///
/// ## Usage
///
/// You can use the ``RequestList``
/// in a [`NavigationStack`](https://developer.apple.com/documentation/swiftui/navigationstack) inside any
/// SwiftUI [`View`](https://developer.apple.com/documentation/swiftui/view) within a Spezi-based application:
/// ```swift
/// struct ExampleView: View {
///     var body: some View {
///         NavigationStack {
///             FHIRMockWebServiceTestsView()
///         }
///     }
/// }
/// ```
public struct RequestList: View {
    @EnvironmentObject private var webService: MockWebService
    
    
    public var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            if webService.requests.isEmpty {
                VStack(spacing: 32) {
                    Image(systemName: "server.rack")
                        .font(.system(size: 100))
                        .accessibilityHidden(true)
                    Text(String(localized: "MOCK_REQUESTS_LIST_PLACEHOLDER", bundle: .module))
                        .multilineTextAlignment(.center)
                }
                    .padding(32)
            } else {
                List(webService.requests) { request in
                    NavigationLink(value: request) {
                        RequestHeader(request: request)
                    }
                }
            }
        }
            .navigationDestination(for: Request.self) { request in
                RequestDetailView(request: request)
            }
            .navigationTitle(String(localized: "MOCK_REQUESTS_LIST_TITLE", bundle: .module))
    }
    
    
    /// Creates an instance of a ``RequestList``.
    public init() {}
    
    
    private func format(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .long
        return dateFormatter.string(from: date)
    }
}


#if DEBUG
struct WebServicesList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RequestList()
                .environmentObject(MockWebService())
        }
    }
}
#endif
