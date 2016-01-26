## Module Data.UUID

#### `UUID`

``` purescript
newtype UUID
```

##### Instances
``` purescript
Show UUID
```

#### `GENUUID`

``` purescript
data GENUUID :: !
```

#### `genUUID`

``` purescript
genUUID :: forall e. Eff (uuid :: GENUUID | e) UUID
```

Generates a v4 UUID with default options.


