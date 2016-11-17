## Module Data.UUID

#### `UUID`

``` purescript
newtype UUID
```

##### Instances
``` purescript
Show UUID
Eq UUID
Ord UUID
```

#### `GENUUID`

``` purescript
data GENUUID :: !
```

The effect of generating a new UUID.

#### `genUUID`

``` purescript
genUUID :: forall e. Eff (uuid :: GENUUID | e) UUID
```

Generates a v4 UUID

#### `parseUUID`

``` purescript
parseUUID :: String -> Maybe UUID
```

Validates a String as a v4 UUID


