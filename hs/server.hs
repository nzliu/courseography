{-# LANGUAGE OverloadedStrings #-}

module Main where
import Data.ByteString.Lazy.Char8
import Data.ByteString.Char8
import Data.String
import Control.Monad    (msum)
import Happstack.Server
import           Text.Blaze ((!))
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A
import MakeElements
import MasterTemplate
import GridResponse
import GraphResponse
import AboutResponse

graph :: String
graph = "graph"

grid :: String
grid = "grid"

about :: String
about = "about"

static :: String
static = "static"

staticDir :: String
staticDir = "C:\\Users\\David\\Documents\\courseography"

main :: IO ()
main = simpleHTTP nullConf $
  msum [ dir grid $ gridResponse,
         dir graph $ graphResponse,
         dir about $ aboutResponse,
         dir static $ serveDirectory EnableBrowsing [] staticDir

       ]