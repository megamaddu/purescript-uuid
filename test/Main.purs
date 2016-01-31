module Test.Main where

import Prelude
import Control.Monad.Eff
import Control.Monad.Eff.Console

import Control.Monad.Aff

import Data.Maybe
import Data.Maybe.Unsafe
import Data.String
import Data.UUID

import Test.Spec
import Test.Spec.Assertions
import Test.Spec.Runner
import Test.Spec.Reporter.Console

main :: forall e. Eff (uuid :: GENUUID, console :: CONSOLE, process :: Process | e) Unit
main = run [consoleReporter] do
  describe "Data.UUID" do
    it "`genUUID` returns a uuid" do
      uuid <- liftEff' genUUID
      (length <<< show) uuid `shouldEqual` 44

    it "`parseUUID` parses a valid uuid as Just UUID" do
      let uuidStr = "d0778cf2-3a4c-42ef-acbd-1269b6bec204"
          uuid = parseUUID uuidStr
      uuidStr `shouldEqual` (show $ fromJust uuid)

    it "`parseUUID` parses an invalid uuid as Nothing" do
      let uuidStr = "foo"
          uuid = parseUUID uuidStr
      Nothing `shouldEqual` uuid
