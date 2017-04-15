{-# LANGUAGE OverloadedStrings, DeriveGeneric #-}
import Web.Scotty
import Network.Wai.Middleware.RequestLogger
import GHC.Generics
import Data.Aeson (FromJSON, ToJSON)

data User = User { 
    userId :: Int,
    userName :: String
} deriving (Show, Generic)

instance ToJSON User
instance FromJSON User

bob :: User
bob = User{
    userId=1,
    userName="bob"
}

hello :: ActionM ()
hello = do
    setHeader "Content-Type" "text/html"
    text "hello"

helloJSON :: ActionM ()
helloJSON = do
    setHeader "Content-Type" "application/json"
    json ("hello, world" :: String)

userJSON :: ActionM()
userJSON = do
    setHeader "Content-Type" "application/json"
    json bob

main :: IO ()
main = scotty 3000 $ do
    {- middleware logStdoutDev -}

    get "/hello" hello
    get "/hello/json" helloJSON
    get "/hello/bob" userJSON
