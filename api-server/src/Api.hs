module Api (
    hello
) where

import Web.Scotty
import Prelude

hello :: ActionM ()
hello = do
    text "hello"
