<!--
                  
This source file is part of the Stanford Spezi open source project

SPDX-FileCopyrightText: 2022 Stanford University and the project authors (see CONTRIBUTORS.md)

SPDX-License-Identifier: MIT
             
-->

# SpeziMockWebService

[![Build and Test](https://github.com/StanfordSpezi/SpeziMockWebService/actions/workflows/build-and-test.yml/badge.svg)](https://github.com/StanfordSpezi/SpeziMockWebService/actions/workflows/build-and-test.yml)
[![codecov](https://codecov.io/gh/StanfordSpezi/SpeziMockWebService/branch/main/graph/badge.svg?token=03JWYVR9YO)](https://codecov.io/gh/StanfordSpezi/SpeziMockWebService)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.8239945.svg)](https://doi.org/10.5281/zenodo.8239945)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FStanfordSpezi%2FSpeziMockWebService%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/StanfordSpezi/SpeziMockWebService)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FStanfordSpezi%2FSpeziMockWebService%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/StanfordSpezi/SpeziMockWebService)


Mock the interaction with a web service in a Spezi-based application.


## Overview

The Spezi Mock Web Service Swift Package provides a [Spezi Component](https://swiftpackageindex.com/stanfordspezi/spezi/documentation/spezi/component) ([`MockWebService`](https://swiftpackageindex.com/stanfordspezi/spezimockwebservice/documentation/spezimockwebservice/mockwebservice)) to mock the interaction with a web service and display the requests in a user interface that can be used for demonstrations and debugging purposes ([`RequestList`](https://swiftpackageindex.com/stanfordspezi/spezimockwebservice/documentation/spezimockwebservice/requestlist)).

<p float="left">
    <p>
        <img width="272" height="536" alt="Screenshot showing an empty list with a placeholder stating: 'The Mock Web Service will display all requests that would be triggered by the application.'." src="Sources/SpeziMockWebService/SpeziMockWebService.docc/Resources/Overview.png">
        The landing page of the <a href="https://swiftpackageindex.com/stanfordspezi/spezimockwebservice/documentation/spezimockwebservice/requestlist">RequestList</a>.
    </p>
    <p>
        <img width="272" height="536" alt="Screenshot showing two requests in the mock request list: One is a deletion request, and one is an addition." src="Sources/SpeziMockWebService/SpeziMockWebService.docc/Resources/Requests.png">
        The <a href="https://swiftpackageindex.com/stanfordspezi/spezimockwebservice/documentation/spezimockwebservice/requestlist">RequestList</a> provides an overview of all sent requests.
    </p>
    <p>
        <img width="272" height="536" alt="Detail view of a mock request, showing that it is an addition with a short JSON body." src="Sources/SpeziMockWebService/SpeziMockWebService.docc/Resources/Request.png">
        The detail view of a single request.
    </p>
</p>

       
## Example

The following example demonstrates the usage of the Swift Package in a SwiftUI `View`, accessing the [`MockWebService`](https://swiftpackageindex.com/stanfordspezi/spezimockwebservice/documentation/spezimockwebservice/mockwebservice) using the `@EnvironmentObject` property wrapper.
The `ExampleView` displays the [`RequestList`](https://swiftpackageindex.com/stanfordspezi/spezimockwebservice/documentation/spezimockwebservice/requestlist) in a `NavigationStack` and has a private function that uses the injected [`MockWebService`](https://swiftpackageindex.com/stanfordspezi/spezimockwebservice/documentation/spezimockwebservice/mockwebservice) to call the [`MockWebService/upload(path:body:)`](https://swiftpackageindex.com/stanfordspezi/spezimockwebservice/documentation/spezimockwebservice/mockwebservice/upload(path:body:)) and [`MockWebService/remove(path:)`](https://swiftpackageindex.com/stanfordspezi/spezimockwebservice/documentation/spezimockwebservice/mockwebservice/remove(path:)) functions, mocking the interaction with a real web service.

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

For more information, please refer to the [API documentation](https://swiftpackageindex.com/StanfordSpezi/SpeziMockWebService/documentation).


## Contributing

Contributions to this project are welcome. Please make sure to read the [contribution guidelines](https://github.com/StanfordSpezi/.github/blob/main/CONTRIBUTING.md) and the [contributor covenant code of conduct](https://github.com/StanfordSpezi/.github/blob/main/CODE_OF_CONDUCT.md) first.


## License

This project is licensed under the MIT License. See [Licenses](https://github.com/StanfordSpezi/SpeziContact/tree/main/LICENSES) for more information.

![Spezi Footer](https://raw.githubusercontent.com/StanfordSpezi/.github/main/assets/FooterLight.png#gh-light-mode-only)
![Spezi Footer](https://raw.githubusercontent.com/StanfordSpezi/.github/main/assets/FooterDark.png#gh-dark-mode-only)
