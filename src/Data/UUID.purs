module Data.UUID
  ( UUID()
  , genUUID
  , parseUUID
  , genv3UUID
  , genv5UUID
  ) where

import Data.Maybe (Maybe(Nothing, Just))
import Debug.Trace (spy)
import Effect (Effect)
import Prelude (class Eq, class Ord, class Show, pure, ($), (<<<), (>>=))

newtype UUID = UUID String

foreign import getUUIDImpl :: Effect String

-- | Generates a v4 UUID
genUUID :: Effect UUID
genUUID = getUUIDImpl >>= pure <<< UUID

foreign import validateV4UUID :: String -> Boolean

-- | Validates a String as a v4 UUID
parseUUID :: String -> Maybe UUID
parseUUID str = case validateV4UUID str of
  true -> Just $ UUID str
  _    -> Nothing

foreign import getUUID3Impl :: String -> String -> String

genv3UUID :: String -> UUID -> UUID
genv3UUID s (UUID n) = UUID $ getUUID3Impl s n

foreign import getUUID5Impl :: String -> String -> String

genv5UUID :: String -> UUID -> UUID
genv5UUID s (UUID n) = UUID (getUUID5Impl s n)

instance showUUID :: Show UUID where
  show (UUID uuid) = uuid

derive instance eqUUID :: Eq UUID
derive instance ordUUID :: Ord UUID
