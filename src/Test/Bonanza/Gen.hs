module Test.Bonanza.Gen where

-- Contents copied from https://hackage.haskell.org/package/QuickCheck-2.14.1

import Control.Monad (ap)
import System.Random

newtype Gen a = MkGen
  { -- | Run the generator on a particular seed.
    -- If you just want to get a random value out, consider using 'generate'.
    unGen :: QCGen -> Int -> a
  }

instance Functor Gen where
  fmap f (MkGen h) =
    MkGen (\r n -> f (h r n))

instance Applicative Gen where
  pure x =
    MkGen (\_ _ -> x)
  (<*>) = ap

instance Monad Gen where
  return = pure

  MkGen m >>= k =
    MkGen
      ( \r n ->
          case split r of
            (r1, r2) ->
              let MkGen m' = k (m r1 n)
               in m' r2 n
      )

  (>>) = (*>)

newtype QCGen = QCGen StdGen

instance RandomGen QCGen where
  split (QCGen g) =
    case split g of
      (g1, g2) -> (QCGen g1, QCGen g2)
  genRange (QCGen g) = genRange g
  next = wrapQCGen next

{-# INLINE wrapQCGen #-}
wrapQCGen :: (StdGen -> (a, StdGen)) -> (QCGen -> (a, QCGen))
wrapQCGen f (QCGen g) =
  case f g of
    (x, g') -> (x, QCGen g')
