module Test.Main where

import Prelude
import Control.Monad.Eff
import Control.Monad.Eff.Console

import Control.Monad.Aff

import Data.String
import Data.UUID

import Test.Spec
import Test.Spec.Assertions
import Test.Spec.Runner
import Test.Spec.Reporter.Console

main :: forall e. Eff (uuid :: GENUUID, console :: CONSOLE, process :: Process | e) Unit
main = run [consoleReporter] do
  describe "genUUID :: Eff _ UUID" do
    it "returns a uuid" do
      uuid <- liftEff' genUUID
      (length <<< show) uuid `shouldEqual` 44
