module Main where

import Turtle
import qualified Data.Text.IO as T
import System.IO

-- appends to file and outputs to stdout
-- usage: λ> viewAndAppendFile "/tmp/test" (inshell "ls /home/cody" empty)
viewAndAppendFile :: String -> Shell Line -> IO ()
viewAndAppendFile fileName shellInput = sh $ do
    x <- shellInput -- `x` ranges over every output of `s`
    liftIO $ do
      withFile fileName AppendMode $ \h -> T.hPutStrLn h (lineToText x)
    liftIO $ print x


-- viewAndAction :: Show a => Shell a -> (a -> IO ())-> IO ()
-- viewAndAction shellInput someAction = sh $ do
--     x <- shellInput -- `x` ranges over every output of `s`
--     liftIO $ someAction x
--     liftIO $ print x



main :: IO ()
main = do
  putStrLn "hello world"
