{-# LANGUAGE OverloadedStrings #-}
import Web.Scotty
import Lib

main :: IO ()
main = scotty 3000 $ do
    get "/hello" $ do
        text "hello, wataori-mart"
