{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name =
    "uuid"
, license =
    "MIT"
, repository =
    "https://github.com/spicydonuts/purescript-uuid.git"
, dependencies =
    [ "console"
    , "effect"
    , "psci-support"
    , "spec"
    , "foreign-generic"
    ]
, packages =
    ./packages.dhall
, sources =
    [ "src/**/*.purs", "test/**/*.purs" ]
}
