import ProjectDescription

let project = Project(
    name: "Dogs",
    targets: [
        Target(
            name: "Dogs",
            platform: .iOS,
            product: .app,
            bundleId: "com.djorkaeff.Dogs",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [:]
                ]
            ),
            sources: [
                "Sources/**"
            ],
            dependencies: [
                
            ]
        ),
    ]
)
