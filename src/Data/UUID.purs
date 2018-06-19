module Data.UUID
  ( UUID()
  , genUUID
  , parseUUID
  ) where

import Data.Maybe (Maybe(Nothing, Just))
import Effect (Effect)
import Prelude (class Ord, class Eq, class Show, compare, (==), ($), pure, (<<<), (>>=))

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

instance showUUID :: Show UUID where
  show (UUID uuid) = uuid

instance eqUUID :: Eq UUID where
  eq (UUID uA) (UUID uB) = uA == uB

instance ordUUID :: Ord UUID where
  compare (UUID uA) (UUID uB) = compare uA uB
