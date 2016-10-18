module Test.Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Class (liftEff)
import Control.Monad.Eff.Console (CONSOLE)
import Data.Maybe (Maybe(..), fromJust)
import Data.String (length)
import Data.UUID (parseUUID, genUUID, GENUUID)
import Node.Process (PROCESS)
import Partial.Unsafe (unsafePartial)
import Test.Spec (it, describe)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (run)

main :: forall e. Eff (uuid :: GENUUID, console :: CONSOLE, process :: PROCESS | e) Unit
main = unsafePartial $ run [consoleReporter] do
  describe "Data.UUID" do
    it "`genUUID` returns a uuid" do
      uuid <- liftEff genUUID
      (length <<< show) uuid `shouldEqual` 36

    it "`parseUUID` parses a valid uuid as Just UUID" do
      let uuidStr = "d0778cf2-3a4c-42ef-acbd-1269b6bec204"
          uuid = parseUUID uuidStr
      uuidStr `shouldEqual` (show $ fromJust uuid)

    it "`parseUUID` parses an invalid uuid as Nothing" do
      let uuidStr = "foo"
          uuid = parseUUID uuidStr
      Nothing `shouldEqual` uuid
