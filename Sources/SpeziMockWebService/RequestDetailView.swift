//
// This source file is part of the Stanford Spezi open-source project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

import SpeziViews
import SwiftUI


struct RequestDetailView: View {
    let request: Request
    
    
    var body: some View {
        List {
            Section(String(localized: "MOCK_REQUEST_DETAIL_HEADER", bundle: .module)) {
                RequestHeader(request: request)
            }
            if let body = request.body {
                Section(String(localized: "MOCK_REQUEST_DETAIL_BODY", bundle: .module)) {
                    LazyText(verbatim: body)
                }
            }
        }
            .listStyle(.insetGrouped)
            .navigationTitle(String(localized: "MOCK_REQUEST_DETAIL_TITLE", bundle: .module))
    }
}


#if DEBUG
struct RequestDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RequestDetailView(
            request: Request(
                type: .add,
                path: "A Path",
                body: "A Body ..."
            )
        )
    }
}
#endif
