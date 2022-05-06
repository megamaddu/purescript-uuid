let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.15.0-20220505/packages.dhall
        sha256:ba57c25c86fd54c2b672cda3a6836bbbdff4b1bbf946bceaabb64e5a10285638

in  upstream
  with foreign-generic =
    { repo = "https://github.com/working-group-purescript-es/purescript-foreign-generic.git"
    , dependencies = [ "foreign", "foreign-object", "ordered-collections", "exceptions", "record", "identity" ]
    , version = "v0.15.0-updates"
    }
