module Control.Monad.Eff.Console.Timer (
  Timer,
  time,
  timeEnd,
  time',
  timeEnd'
) where

import Data.Function (const)
import Data.Functor ((<$>))
import Data.Symbol (class IsSymbol, SProxy(..), reflectSymbol)
import Data.Unit (Unit)

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)

-- | The type constructed by `time`.
data Timer (name :: Symbol) = Timer

timerStr :: forall name. IsSymbol name => Timer name -> String
timerStr _ = reflectSymbol (SProxy :: SProxy name)

-- | Start a timer.
-- |
-- | ``` purescript
-- | main :: Eff (console :: CONSOLE) Unit
-- | main = do
-- |   timer :: Timer "example" <- time
-- |   timeEnd timer
-- | ```
time :: forall name eff. IsSymbol name =>
  Eff (console :: CONSOLE | eff) (Timer name)
time = const timer <$> time' (timerStr timer)
  where timer = Timer

-- | End a timer and write the timing message to the console.
timeEnd :: forall name eff. IsSymbol name =>
  Timer name -> Eff (console :: CONSOLE | eff) Unit
timeEnd timer = timeEnd' (timerStr timer)

-- | String-based timer start.
-- |
-- | ``` purescript
-- | main :: Eff (console :: CONSOLE) Unit
-- | main = do
-- |  let timerName = "another example"
-- |  time' timerName
-- |  timeEnd' timerName
-- | ```
foreign import time'
  :: forall eff
   . String
  -> Eff (console :: CONSOLE | eff) Unit

-- | String-based timer end.
foreign import timeEnd'
  :: forall eff
   . String
  -> Eff (console :: CONSOLE | eff) Unit
