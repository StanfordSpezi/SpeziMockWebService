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

The Spezi Mock Web Service Swift Package provides a [Spezi Component](https://swiftpackageindex.com/stanfordspezi/spezi/documentation/spezi/component) (``MockWebService``)
to mock the interaction with a web service and display the requests in a user interface that can be used for demonstrations and debugging purposes (``RequestList``).

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


## Setup

### 1. Add Spezi Mock Web Service as a Dependency

You need to add the Spezi Mock Web Service Swift package to
[your app in Xcode](https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app#) or
[Swift package](https://developer.apple.com/documentation/xcode/creating-a-standalone-swift-package-with-xcode#Add-a-dependency-on-another-Swift-package).

> Important: If your application is not yet configured to use Spezi, follow the [Spezi setup article](https://swiftpackageindex.com/stanfordspezi/spezi/documentation/spezi/initial-setup) setup the core Spezi infrastructure.


### 2. Register the Component

The ``MockWebService`` component needs to be registered in a Spezi-based application using the 
[`configuration`](https://swiftpackageindex.com/stanfordspezi/spezi/documentation/spezi/speziappdelegate/configuration) in a
[`SpeziAppDelegate`](https://swiftpackageindex.com/stanfordspezi/spezi/documentation/spezi/speziappdelegate):
```swift
class ExampleAppDelegate: SpeziAppDelegate {
    override var configuration: Configuration {
        Configuration {
            MockWebService()
            // ...
        }
    }
}
```

> Tip: You can learn more about a [`Component` in the Spezi documentation](https://swiftpackageindex.com/stanfordspezi/spezi/documentation/spezi/component).


## Example

The following example demonstrates the usage of the Swift Package in a SwiftUI [`View`](https://developer.apple.com/documentation/swiftui/view),
accessing the ``MockWebService`` using the [`@EnvironmentObject`](https://developer.apple.com/documentation/swiftui/environmentobject) property wrapper.

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

The `ExampleView` displays the ``RequestList`` in a  [`NavigationStack`](https://developer.apple.com/documentation/swiftui/navigationstack)
and has a private function that uses the injected ``MockWebService`` to call the ``MockWebService/upload(path:body:)`` and ``MockWebService/remove(path:)`` 
functions, mocking the interaction with a real web service.


## Topics

- ``MockWebService``
- ``RequestList``
