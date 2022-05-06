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
    [ "prelude"
    , "aff"
    , "effect"
    , "either"
    , "foreign-generic"
    , "foreign"
    , "lists"
    , "maybe"
    , "partial"
    , "spec"
    , "strings"
    , "transformers"
    ]
, packages =
    ./packages.dhall
, sources =
    [ "src/**/*.purs", "test/**/*.purs" ]
}
