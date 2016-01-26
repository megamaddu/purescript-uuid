module Data.UUID
  ( UUID()
  , GENUUID()
  , genUUID
  ) where

import Prelude
import Control.Monad.Eff

newtype UUID = UUID String

foreign import data GENUUID :: !

foreign import getUUIDImpl :: forall e. Eff (uuid :: GENUUID | e) String

-- | Generates a v4 UUID with default options.
genUUID :: forall e. Eff (uuid :: GENUUID | e) UUID
genUUID = do
  uuidStr <- getUUIDImpl
  pure $ UUID uuidStr

instance showUUID :: Show UUID where
  show (UUID uuid) = uuid
