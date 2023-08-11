# ``SpeziMockWebService``

<!--
#
# This source file is part of the Stanford Spezi open source project
#
# SPDX-FileCopyrightText: 2022 Stanford University and the project authors (see CONTRIBUTORS.md)
#
# SPDX-License-Identifier: MIT
#       
-->

Mock the interaction with a web service in a Spezi-based application.


## Overview

The Spezi Mock Web Service Swift Package provides a [Spezi Component](https://swiftpackageindex.com/stanfordspezi/spezi/documentation/spezi/component) (``MockWebService``) to mock the interaction with a web service and display the requests in a user interface that can be used for demonstrations and debugging purposes (``RequestList``).

@Row {
    @Column {
        @Image(source: "Overview", alt: "Screenshot showing an empty list with a placeholder stating: \"The Mock Web Service will display all requests that would be triggered by the application.\".") {
            The landing page of the ``RequestList``.
        }
    }
    @Column {
        @Image(source: "Requests", alt: "Screenshot showing two requests in the mock request list: One is a deletion request, and one is an addition.") {
            The ``RequestList`` provides an overview of all sent requests.
        }
    }
    @Column {
        @Image(source: "Request", alt: "Detail view of a mock request, showing that it is an addition with a short JSON body.") {
            The detail view of a single request.
        }
    }
}
       
## Example

The following example demonstrates the usage of the Swift Package in a SwiftUI `View`, accessing the ``MockWebService`` using the `@EnvironmentObject` property wrapper.
The `ExampleView` displays the ``RequestList`` in a `NavigationStack` and has a private function that uses the injected ``MockWebService`` to call the ``MockWebService/upload(path:body:)`` and ``MockWebService/remove(path:)`` functions, mocking the interaction with a real web service.

```swift
import SpeziMockWebService
import SwiftUI


struct ExampleView: View {
    @EnvironmentObject var webService: MockWebService
    
    
    var body: some View {
        NavigationStack {
            RequestList()
            // ...
        }
    }
    
    
    private func sendMockUploadRequests() async throws {
        try await webService.upload(path: "Test", body: #"{"test": "test"}"#)
        try await webService.remove(path: "TestRemoval")
    }
}
```

## Topics

- ``MockWebService``
- ``RequestList``
