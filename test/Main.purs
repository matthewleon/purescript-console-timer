module Test.Main where

import Control.Monad (bind)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Control.Monad.Eff.Console.Timer (Timer, time, timeEnd, time', timeEnd')
import Data.Unit (Unit)

main :: Eff (console :: CONSOLE) Unit
main = do
  timer :: Timer "example" <- time
  timeEnd timer

  let timerName = "another example"
  time' timerName
  timeEnd' timerName
