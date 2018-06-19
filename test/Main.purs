module Test.Main where

import Prelude

import Data.Maybe (Maybe(..), fromJust)
import Data.String (length)
import Data.UUID (genUUID, parseUUID)
import Effect (Effect)
import Effect.Unsafe (unsafePerformEffect)
import Partial.Unsafe (unsafePartial)
import Test.Spec (it, describe)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (run)

main :: Effect Unit
main = run [consoleReporter] do
  
  describe "UUID" do

    it "`genUUID` returns a uuid" do
      let uuid = unsafePerformEffect genUUID
      (length <<< show) uuid `shouldEqual` 36

    it "`parseUUID` parses a valid uuid as Just UUID" do
      let uuidStr = "d0778cf2-3a4c-42ef-acbd-1269b6bec204"
          uuid = parseUUID uuidStr
      uuidStr `shouldEqual` (show $ unsafePartial $ fromJust uuid)

    it "`parseUUID` parses an invalid uuid as Nothing" do
      let uuidStr = "foo"
          uuid = parseUUID uuidStr
      Nothing `shouldEqual` uuid

