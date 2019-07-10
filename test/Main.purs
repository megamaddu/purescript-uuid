module Test.Main where

import Prelude
import Data.Maybe (Maybe(..), fromJust)
import Data.String (length)
import Data.UUID (genUUID, genv3UUID, genv5UUID, parseUUID, toString)
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class (liftEffect)
import Effect.Unsafe (unsafePerformEffect)
import Partial.Unsafe (unsafePartial)
import Test.Spec (it, describe)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (runSpec)

main :: Effect Unit
main =
  launchAff_ do
    runSpec [ consoleReporter ] do
      describe "UUID" do
        it "`genUUID` returns a uuid" do
          let
            uuid = unsafePerformEffect genUUID
          (length <<< toString) uuid `shouldEqual` 36
        it "`genv3UUID` returns a uuid" do
          namespace <- liftEffect genUUID
          let
            uuid = genv3UUID "foo" namespace
          (length <<< toString) uuid `shouldEqual` 36
        it "`genv5UUID` returns a uuid" do
          namespace <- liftEffect genUUID
          let
            uuid = genv5UUID "foo" namespace
          (length <<< toString) uuid `shouldEqual` 36
        it "`parseUUID` parses a valid uuid as Just UUID" do
          let
            uuidStr = "d0778cf2-3a4c-42ef-acbd-1269b6bec204"

            uuid = parseUUID uuidStr
          uuidStr `shouldEqual` (toString $ unsafePartial $ fromJust uuid)
        it "`parseUUID` parses an invalid uuid as Nothing" do
          let
            uuidStr = "foo"

            uuid = parseUUID uuidStr
          Nothing `shouldEqual` uuid
        it "`show` returns a console-friendly representation of the UUID type" do
          let
            uuidStr = "d0778cf2-3a4c-42ef-acbd-1269b6bec204"

            showUUID = "(UUID d0778cf2-3a4c-42ef-acbd-1269b6bec204)"

            uuid = parseUUID uuidStr
          showUUID `shouldEqual` (show $ unsafePartial $ fromJust uuid)
